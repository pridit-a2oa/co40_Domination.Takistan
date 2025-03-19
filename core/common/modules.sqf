/**
 * Core Module - Common (client & server)
 */

#define THIS_MODULE common
#include "x_macros.sqf"
private ["_config"];

GVAR(modules) = [
    "database" // Requires: @Arma2NET
];

_config = missionConfigFile >> "Params";

for "_i" from 0 to (count (_config) - 1) do {
    if ([paramsArray select _i, 1] call BIS_fnc_areEqual) then {
        GVAR(modules) = GVAR(modules) + [configName ((_config) select _i)];
    };
};

{
    private ["_type"];

    _type = getArray (_config >> _x >> "type");

    if !([_type, []] call BIS_fnc_areEqual) then {
        if !(_type select 0 in GVAR(modules)) exitWith {
            GVAR(modules) set [_forEachIndex, ""];
        };

        GVAR(modules) set [_forEachIndex, [
            format ["%1_%2", _type select 0, _type select 1],
            format ["%1\types\%2", _type select 0, _type select 1]
        ]];
    };
} forEach GVAR(modules);

GVAR(modules) = GVAR(modules) + [
    "setting" // Note: Must be last due to reliance on variables other handlers set
];

GVAR(modules) = GVAR(modules) - [""];

{
    if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {
        _x = _x select 1;
    };

    __module(_x);
} forEach GVAR(modules);

__log format ["%1 modules initialized", count GVAR(modules)]];