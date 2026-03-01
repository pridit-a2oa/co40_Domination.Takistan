/**
 * Accolade Module - Database Submodule
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_identifier", "_experience",  "_accolades"];

PARAMS_1(_identifier);

_experience = ([_this, 1, 0] call FUNC(common,param)) min (call FUNC(THIS_MODULE,max));
_accolades = [_this, 2, []] call FUNC(common,param);

if !([typeName _experience, "SCALAR"] call BIS_fnc_areEqual) exitWith {};

if (isServer && {[_accolades, []] call BIS_fnc_areEqual}) then {
    private ["_key", "_data", "_defaults"];

    _key = [_identifier select 1] call FUNC(THIS_MODULE,key);

    if (isMultiplayer) then {
        waitUntil {sleep 0.5; isNil {serverNamespace getVariable _key}};
    };

    _data = [format [
        "SELECT data FROM character_accolade WHERE character_id = '%1' LIMIT 1",
        _identifier select 0
    ]] call FUNC(database,query);

    _defaults = [];

    {
        _defaults set [_forEachIndex, _x];
    } forEach GVAR(accolade_defaults);

    serverNamespace setVariable [
        _key,
        [
            _identifier,
            if ([_data, []] call BIS_fnc_areEqual) then {
                _defaults
            } else {
                call compile ((_data select 0) select 0)
            }
        ]
    ];
};

if (hasInterface && {!([_accolades, []] call BIS_fnc_areEqual)}) then {
    player setVariable [QGVAR(tasks), _accolades];

    if !([_experience, 0] call BIS_fnc_areEqual) then {
        player setVariable [QGVAR(experience), _experience, true];
    };
};