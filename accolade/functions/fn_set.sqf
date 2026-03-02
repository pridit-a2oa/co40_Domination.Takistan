#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_entry", "_identifier", "_index", "_task", "_npc", "_tracked", "_key", "_accolades", "_tasks", "_array", "_experience"];

PARAMS_2(_entry, _identifier);

if !(isServer) exitWith {};

_index = ([0, GVAR(accolade_types)] call FUNC(common,arrayValues)) find (_entry select 0);
_task = ([0, GVAR(accolade_types_proficiency)] call FUNC(common,arrayValues)) find (_entry select 1);

_npc = ((call compile format ["d_%1_%2_tasks", QUOTE(THIS_MODULE), _entry select 0]) select _task) select 0;

if ([typeName _npc, "ARRAY"] call BIS_fnc_areEqual) then {
    _tracked = [_npc select 1, _identifier] call FUNC(THIS_MODULE,track);
};

_key = _identifier call FUNC(THIS_MODULE,key);

_accolades = serverNamespace getVariable _key;
_tasks = _accolades select 1;

_array = [];

{
    [
        _array,
        if ([_forEachIndex, _task] call BIS_fnc_areEqual) then {
            switch (true) do {
                case ([_x, [0, 0]] call BIS_fnc_areEqual && {[count _entry, 3] call BIS_fnc_areEqual}): {
                    [1, 0]
                };

                case ([_x, [1, 0]] call BIS_fnc_areEqual && {[count _entry, 2] call BIS_fnc_areEqual}): {
                    [1, 1]
                };

                case ([_x, [1, 0]] call BIS_fnc_areEqual && {!([_tracked, []] call BIS_fnc_areEqual) && {(_tracked select 1) >= (_tracked select 0)}});
                case ([_x, [1, 1]] call BIS_fnc_areEqual && {[count _entry, 3] call BIS_fnc_areEqual}): {
                    [2, 1]
                };

                default {
                    [0, 0]
                };
            }
        } else {
            _x
        }
    ] call BIS_fnc_arrayPush;
} forEach ((_accolades select 1) select _index);

if ([_array select _task, [0, 0]] call BIS_fnc_areEqual) exitWith {};

_tasks set [_index, _array];

if ([_array select _task, [2, 1]] call BIS_fnc_areEqual) then {
    [_entry select 0, _task] spawn FUNC(THIS_MODULE,item);

    [format [
        "INSERT INTO character_accolade (character_id, data) VALUES (%1, CAST(""%2"" AS JSON)) ON DUPLICATE KEY UPDATE data = CAST(""%2"" AS JSON)",
        (_accolades select 0) select 0,
        _tasks
    ]] spawn FUNC(database,query);
};

_experience = 0;

if ([_array select _task, [2, 1]] call BIS_fnc_areEqual) then {
    _experience = (GVAR(accolade_types_proficiency) select _task) select 1;

    if !(_experience > 0) exitWith {};

    [format [
        "UPDATE characters SET experience = experience + %1 WHERE `id64` = '%2' AND name = '%3'",
        _experience,
        _identifier select 0,
        _identifier select 1
    ]] spawn FUNC(database,query);
};

{
    if ([[_identifier select 0, _identifier select 1], [getPlayerUID _x, name _x]] call BIS_fnc_areEqual) exitWith {
        [_x, "spawn", [[_experience, _tasks, ["npc", GVAR(accolade_types) select _index]], {
            private ["_experience", "_tasks", "_type", "_rank"];

            PARAMS_3(_experience, _tasks, _type);

            if !(hasInterface) exitWith {};

            player setVariable [QGVAR(experience), ((player getVariable QGVAR(experience)) + _experience) min (call FUNC(THIS_MODULE,max)), true];
            player setVariable [QGVAR(tasks), _tasks];

            [_type] call FUNC(THIS_MODULE,refresh);

            _rank = [player getVariable QGVAR(experience)] call FUNC(THIS_MODULE,rank);

            if ([rank player, _rank] call BIS_fnc_areEqual) exitWith {};

            [true, "setRank", [player, _rank]] call FUNC(network,mp);

            systemChat format [
                "You have been promoted to %1",
                [_rank] call FUNC(common,rank)
            ];

            playSound "beep";
        }]] call FUNC(network,mp);
    };
} forEach call FUNC(common,players);