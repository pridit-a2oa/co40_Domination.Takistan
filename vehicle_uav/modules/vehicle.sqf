/**
 * Vehicle UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_uav_types)) exitWith {};

if (isServer) then {
    private ["_expression"];

    _vehicle allowCrewInImmobile true;

    [true, "execVM", [[], FUNCTION(THIS_MODULE,populate)]] call FUNC(network,mp);

    _vehicle setVariable [QGVAR(vehicle_uav), false];

    _expression = {
        private ["_unit"];

        PARAMS_1(_unit);

        if !(isServer) exitWith {};
        if (_unit getVariable QGVAR(vehicle_uav)) exitWith {};

        _unit setVariable [QGVAR(vehicle_uav), true];

        if !([{isPlayer _x} count crew _unit, 0] call BIS_fnc_areEqual) exitWith {
            {
                if (isPlayer _x) then {
                    [_x, "execVM", [[_unit, false], FUNCTION(THIS_MODULE,control)]] call FUNC(network,mp);
                };
            } forEach crew _unit;
        };

        [true, "execVM", [[], FUNCTION(THIS_MODULE,populate)]] call FUNC(network,mp);
    };

    _vehicle addEventHandler ["Killed", _expression];
    _vehicle addMPEventHandler ["MPKilled", _expression];
};

if (hasInterface) then {
    _vehicle addEventHandler ["getout", {
        private ["_vehicle", "_seat", "_unit"];

        PARAMS_3(_vehicle, _seat, _unit);

        if !([_unit, player] call BIS_fnc_areEqual) exitWith {};
        if !(typeOf _vehicle in GVAR(vehicle_uav_types)) exitWith {};

        if ([GVAR(vehicle_uav_player), []] call BIS_fnc_areEqual) exitWith {
            _vehicle spawn {
                if (canMove _this && {[driver _this, objNull] call BIS_fnc_areEqual}) then {
                    [_this, "setHit", ["motor", 1]] call FUNC(network,mp);

                    sleep 1;

                    [_this, "setHit", ["motor", 0]] call FUNC(network,mp);
                };

                _this engineOn false;
            };
        };

        titleText ["", "BLACK FADED"];

        [_vehicle, false] spawn FUNC(THIS_MODULE,control);
    }];

    _vehicle spawn {
        while {true} do {
            waitUntil {sleep 0.1; !isNull player};

            if (player in _this && {[GVAR(vehicle_uav_player), []] call BIS_fnc_areEqual}) then {
                player action ["Eject", _this];

                ["This vehicle cannot be manually boarded"] call FUNC(client,hint);
            };

            sleep 1;
        };
    };
};