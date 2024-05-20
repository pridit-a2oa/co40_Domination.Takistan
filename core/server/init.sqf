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

X_JIPH setVariable [QGVAR(groups), [], true];

__cppfln(FUNC(THIS_MODULE,cleanup),core\THIS_MODULE\functions\fn_cleanup.sqf);
__cppfln(FUNC(THIS_MODULE,exitMap),core\THIS_MODULE\functions\fn_exitMap.sqf);
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
        __log format ["UNIT: %1 | UID: %2", _x, getPlayerUID _x]];

        if (!isNull _x && {[getPlayerUID _x, _uid] call BIS_fnc_areEqual}) exitWith {
            [gameLogic, "switchMove", [_x, ""]] call FUNC(network,mp);

            if (!alive _x || {_x getVariable QGVAR(unconscious)}) then {
                _x addScore -10;

                [true, "systemChat", format [
                    "%1 has lost score for disconnecting while dead/incapacitated",
                    _name
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
            private ["_uid", "_name", "_identifiers", "_score", "_stored", "_storedScore"];

            PARAMS_2(_uid, _name);

            _identifiers = [GVAR(database_uid), _uid] call BIS_fnc_findNestedElement;

            if ([_identifiers, []] call BIS_fnc_areEqual) exitWith {};

            GVAR(database_uid) = [
                GVAR(database_uid),
                _identifiers select 0
            ] call FUNC(common,deleteAt);

            _score = missionNamespace getVariable (format ["d_%1", _uid]);

            missionNamespace setVariable [
                format ["d_%1", _uid],
                nil
            ];

            _stored = [GVAR(database_score), _name] call BIS_fnc_findNestedElement;
            _storedScore = (GVAR(database_score) select (_stored select 0)) select 1;

            [format [
                "UPDATE characters SET score = score + %1, last_seen_at = NOW() WHERE uid = '%2' AND name = '%3'",
                (_score - _storedScore),
                _uid,
                _name
            ]] call FUNC(database,query);

            GVAR(database_score) = [
                GVAR(database_score),
                _stored select 0
            ] call FUNC(common,deleteAt);
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