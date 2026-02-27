/**
 * Core Module - Server
 */

#define THIS_MODULE server
#include "x_macros.sqf"

// Maximum distance from base friendly AI units should be invulnerable
GVAR(server_distance_base_invulnerable) = 500;

// List of objects that should not be spawned as part of compositions
GVAR(server_objects_banned) = [
    "Barrel1",
    "Barrel4",
    "Barrel5",
    "Barrels",
    "Fort_EnvelopeBig_EP1",
    "HeliH",
    "HMMWV_DES_EP1",
    "Land_Barrel_empty",
    "Land_Barrel_sand",
    "Land_Barrel_water",
    "Land_CamoNetB_EAST_EP1",
    "Land_CamoNetB_NATO_EP1",
    "Land_CamoNetVar_EAST_EP1",
    "Land_coneLight",
    "MetalBucket",
    "RoadCone",
    "TKVehicleBox_EP1",
    "UAZ_Unarmed_TK_EP1",
    "USBasicAmmunitionBox_EP1",
    "USBasicWeapons_EP1",
    "USLaunchers_EP1",
    "USVehicleBox_EP1",
    "UralReammo_TK_EP1"
];

X_JIP setVariable [QGVAR(groups), [], true];

__cppfln(FUNC(THIS_MODULE,cleanup),core\THIS_MODULE\functions\fn_cleanup.sqf);
__cppfln(FUNC(THIS_MODULE,exitMap),core\THIS_MODULE\functions\fn_exitMap.sqf);
__cppfln(FUNC(THIS_MODULE,nearPlayers),core\THIS_MODULE\functions\fn_nearPlayers.sqf);
__cppfln(FUNC(THIS_MODULE,nearRoads),core\THIS_MODULE\functions\fn_nearRoads.sqf);
__cppfln(FUNC(THIS_MODULE,objectId),core\THIS_MODULE\functions\fn_objectId.sqf);
__cppfln(FUNC(THIS_MODULE,objectMapper),core\THIS_MODULE\functions\fn_objectMapper.sqf);
__cppfln(FUNC(THIS_MODULE,spawnGroup),core\THIS_MODULE\functions\fn_spawnGroup.sqf);
__cppfln(FUNC(THIS_MODULE,spawnVehicle),core\THIS_MODULE\functions\fn_spawnVehicle.sqf);

enableSaving [false, false];
enableTeamSwitch false;

createCenter west;
createCenter east;
createCenter civilian;
createCenter resistance;

west setFriend [east, 0.1];
west setFriend [resistance, 1];

east setFriend [west, 0.1];
east setFriend [resistance, 0.1];

resistance setFriend [west, 1];
resistance setFriend [east, 0.1];

onPlayerConnected {
    if ([_name, "__SERVER__"] call BIS_fnc_areEqual) exitWith {};

    __log format ["Player %1 (%2) entered the world", _name, _uid]];
};

onPlayerDisconnected {
    __log format ["Player %1 (%2) returned to lobby", _name, _uid]];

    {
        if (!isNull _x && {[getPlayerUID _x, _uid] call BIS_fnc_areEqual}) exitWith {
            private ["_dead"];

            _x enableSimulation true;

            [gameLogic, "switchMove", [_x, ""]] call FUNC(network,mp);

            _dead = !alive _x;

            if (_dead || {_x getVariable QGVAR(unconscious)}) then {
                _x addScore -10;

                [true, "systemChat", format [
                    "%1 has lost score (10) for disconnecting while %2",
                    _name,
                    if (_dead) then {"dead"} else {"incapacitated"}
                ]] call FUNC(network,mp);
            };

            // _x spawn {
            //     sleep 1;

            //     [_this] joinSilent grpNull;

            //     if (alive _this) then {
            //         _this setDamage 1;

            //         sleep 5;
            //     };

            //     hideBody _this;
            // };
        };
    } forEach (call BIS_fnc_listPlayers + allDead);

    if !(isNil QMODULE(database)) then {
        [_uid, _name] spawn {
            private ["_key", "_variables"];

            _key = [_this select 0] call FUNC(database,key);
            _variables = gameLogic getVariable _key;

            if (isNil "_variables") exitWith {};
            if !([[(_variables select 0) select 1, (_variables select 0) select 2], _this] call BIS_fnc_areEqual) exitWith {};

            [format [
                "UPDATE characters SET score = score + %1, last_seen_at = NOW() WHERE `id64` = '%2' AND name = '%3'",
                ((_variables select 1) select 2) select 2,
                _this select 0,
                _this select 1
            ]] call FUNC(database,query);

            gameLogic setVariable [_key, nil];

            if !(isNil QMODULE(accolade)) then {
                private ["_key", "_accolades"];

                _key = [_this select 0] call FUNC(accolade,key);
                _accolades = gameLogic getVariable _key;

                if !([_accolades select 1, GVAR(accolade_defaults)] call BIS_fnc_areEqual) then {
                    [format [
                        "INSERT INTO character_accolade (character_id, data) VALUES (%1, CAST(""%2"" AS JSON)) ON DUPLICATE KEY UPDATE data = CAST(""%2"" AS JSON)",
                        (_accolades select 0) select 0,
                        _accolades select 1
                    ]] call FUNC(database,query);
                };

                gameLogic setVariable [_key, nil];
            };
        };
    };

    if !(isNil QMODULE(name)) then {
        [true, "deleteMarkerLocal", format ["player_%1", _name]] call FUNC(network,mp);
    };

    if !(isNil QMODULE(vote)) then {
        _uid spawn {
            sleep 1;

            [_this] call FUNC(vote,delete);
        };
    };
};

MODULE(THIS_MODULE) = true;