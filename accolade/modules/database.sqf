/**
 * Accolade Module - Database Submodule
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_identifier", "_experience",  "_accolades"];

PARAMS_1(_identifier);

// [0, 0]
// [0, 1] - Fulfilled
// [1, 0] - Accepted
// [1, 1] - Accepted, Fulfilled
// [2, 1] - Completed, Fulfilled

// ^ This way means I can just run one query, and it won't update
// I don't think if the value is the same whereas a VALUE + 1 would
// plus also being infinite, otherwise I have to query the value first

_experience = ([_this, 1, 0] call FUNC(common,param)) min (call FUNC(THIS_MODULE,max));
_accolades = [_this, 2, []] call FUNC(common,param);

if !([typeName _experience, "SCALAR"] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    private ["_key", "_data", "_tasks"];

    _key = [_identifier select 1] call FUNC(THIS_MODULE,key);

    if !(isNil {gameLogic getVariable _key}) exitWith {};

    _data = [format [
        "SELECT data FROM character_accolade WHERE character_id = '%1' LIMIT 1",
        _identifier select 0
    ]] call FUNC(database,query);

    if ([_data, []] call BIS_fnc_areEqual) then {
        _tasks = [];

        {
            private ["_array"];

            _array = [];

            for "_i" from 1 to (count (call compile format ["d_%1_%2_tasks", QUOTE(THIS_MODULE), _x select 0])) do {
                [_array, [0, 0]] call BIS_fnc_arrayPush;
            };

            [_tasks, _array] call BIS_fnc_arrayPush;
        } forEach GVAR(accolade_types);
    } else {
        _tasks = call compile ((_data select 0) select 0);
    };

    gameLogic setVariable [_key, [_identifier, _tasks]];
};

if (hasInterface && {!([_accolades, []] call BIS_fnc_areEqual)}) then {
    player setVariable [QGVAR(tasks), _accolades];

    if !([_experience, 0] call BIS_fnc_areEqual) then {
        player setVariable [QGVAR(experience), _experience];
    };

    systemChat format ["%1", _accolades];
};