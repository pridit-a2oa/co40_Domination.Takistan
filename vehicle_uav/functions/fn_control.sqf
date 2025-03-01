#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle", "_state"];

PARAMS_2(_vehicle, _state);

switch (_state) do {
    case true: {
        GVAR(vehicle_uav_player) = [direction player, position player];

        // [
        //     "ESTABLISHING UPLINK",
        //     GVAR(vehicle_uav_time_wait),
        //     true,
        //     true
        // ] call FUNC(client,transition);

        if ([(_vehicle emptyPositions "Driver") + (_vehicle emptyPositions "Gunner"), 0] call BIS_fnc_areEqual) exitWith {
            _state = false;
        };

        if !(alive _vehicle && {alive player}) exitWith {
            _state = false;
        };

        player switchCamera "INTERNAL";

        switch (true) do {
            case ([driver _vehicle, objNull] call BIS_fnc_areEqual): {
                player moveInDriver _vehicle;
            };

            case ([gunner _vehicle, objNull] call BIS_fnc_areEqual): {
                if ([driver _vehicle, objNull] call BIS_fnc_areEqual) then {
                    [gameLogic, "setOwner", [_vehicle, player]] call FUNC(network,mp);
                };

                player moveInGunner _vehicle;

                setGroupIconsVisible [true, true];
            };

            default {
                _state = false;
            };
        };

        _vehicle spawn {
            waitUntil {
                sleep 0.1;

                if !(alive _this && {alive player}) exitWith {true};

                [vehicle player, _this] call BIS_fnc_areEqual
            };

            while {[vehicle player, _this] call BIS_fnc_areEqual} do {
                waitUntil {sleep 0.01; !isNull (findDisplay 49)};

                if !([vehicle player, _this] call BIS_fnc_areEqual) exitWith {};

                // Disable 'Respawn' menu option
                ((findDisplay 49) displayCtrl 1010) ctrlEnable false;
            };
        };

        {
            if (isPlayer _x && {!([player, _x] call BIS_fnc_areEqual)}) then {
                [_x, "systemChat", format ["[UAV] %1 connected", name player]] call FUNC(network,mp);
                [_x, "playSound", QGVAR(sound_connected)] call FUNC(network,mp);
            };
        } forEach crew _vehicle;
    };

    case false: {
        if ([vehicle player, player] call BIS_fnc_areEqual) exitWith {};

        if ([driver _vehicle, player] call BIS_fnc_areEqual) then {
            [_vehicle, "engineOn", false] call FUNC(network,mp);
        };

        moveOut player;

        // Hacky fix to seat locality by returning to server when AI controlled,
        // otherwise gunner gets stuck
        // [gameLogic, "spawn", [[_vehicle], {
        //     private ["_vehicle", "_unit"];

        //     PARAMS_1(_vehicle);

        //     if (!isNull (driver _vehicle) && {!isPlayer (driver _vehicle)}) then {
        //         __log format ["%1", owner _vehicle]];

        //         _unit = (group _vehicle) createUnit ["US_Soldier_Pilot_EP1", [0, 0, 0], [], 0, "NONE"];

        //         _unit assignAsGunner _vehicle;
        //         _unit moveInGunner _vehicle;

        //         _vehicle setOwner (owner gameLogic);

        //         sleep 1;

        //         moveOut _unit;

        //         _unit setDamage 1;

        //         deleteVehicle _unit;

        //         __log format ["%1", owner _vehicle]];
        //     };
        // }]] call FUNC(network,mp);

        {
            if (isPlayer _x && {!([player, _x] call BIS_fnc_areEqual)}) then {
                [_x, "systemChat", format ["[UAV] %1 disconnected", name player]] call FUNC(network,mp);
                [_x, "playSound", QGVAR(sound_disconnected)] call FUNC(network,mp);
            };
        } forEach crew _vehicle;

        setGroupIconsVisible [false, false];

        [true, "switchMove", [player, ""]] call FUNC(network,mp);

        player setVelocity [0, 0, 0];

        player setDir (GVAR(vehicle_uav_player) select 0);
        player setPos (GVAR(vehicle_uav_player) select 1);

        // [
        //     "UPLINK LOST",
        //     GVAR(vehicle_uav_time_wait),
        //     true,
        //     true
        // ] call FUNC(client,transition);

        if !([] call FUNC(common,ready)) exitWith {};

        if ([typeOf (unitBackpack player), "US_UAV_Pack_EP1"] call BIS_fnc_areEqual) then {
            player switchAction "SitDown";
        };

        player switchCamera (if !(isNil QMODULE(setting)) then {
            ((player getVariable QGVAR(camera)) select 1)
        } else {
            "EXTERNAL"
        });
    };
};

player setCaptive _state;

[true, "hideObject", [player, _state]] call FUNC(network,mp);

hcShowBar _state;

[_state] call FUNC(THIS_MODULE,effect);