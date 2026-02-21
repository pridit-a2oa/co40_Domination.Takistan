#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_entry", "_identifier", "_index", "_key", "_accolades", "_tasks"];

PARAMS_2(_entry, _identifier);

if !(isServer) exitWith {};

_index = ([0, GVAR(accolade_types)] call FUNC(common,arrayValues)) find (_entry select 0);

_key = [_identifier select 0] call FUNC(THIS_MODULE,key);

_accolades = gameLogic getVariable _key;

_tasks = _accolades select 1;

(_tasks select _index) set [0, [1, 0]];

gameLogic setVariable [
    _key,
    [_accolades select 0, _tasks]
];

[format [
    "INSERT INTO character_accolade (character_id, data) VALUES (%1, CAST(""%2"" AS JSON)) ON DUPLICATE KEY UPDATE data = CAST(""%2"" AS JSON)",
    (_accolades select 0) select 0,
    _tasks
]] spawn FUNC(database,query);

{
    if ([[_identifier select 0, _identifier select 1], [getPlayerUID _x, name _x]] call BIS_fnc_areEqual) exitWith {
        [_x, "spawn", [[_tasks, ["npc", GVAR(accolade_types) select _index]], {
            private ["_tasks", "_type"];

            PARAMS_2(_tasks, _type);

            player setVariable [QGVAR(tasks), _tasks];

            [_type] call FUNC(THIS_MODULE,refresh);
        }]] call FUNC(network,mp);
    };
} forEach call FUNC(common,players);