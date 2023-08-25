#define THIS_MODULE gear
#include "x_macros.sqf"
private ["_gear", "_type", "_context", "_exclusions", "_excluded"];

PARAMS_3(_gear, _type, _context);

switch (_type) do {
    case "magazine": {
        _exclusions = GVAR(gear_exclude_magazines);
    };

    case "weapon": {
        _exclusions = GVAR(gear_exclude_weapons);

        if !(isNil QMODULE(item)) then {
            [_exclusions, __submodulePP(item)] call BIS_fnc_arrayPushStack;
        };
    };
};

_excluded = [];

{
    if (_x in _exclusions) then {
        _gear = [_gear, _gear find _x] call FUNC(common,deleteAt);

        [
            _excluded,
            getText (configFile >> "CfgWeapons" >> _x >> "displayName")
        ] call BIS_fnc_arrayPush;
    };
} forEach _gear;

if (!isNil "_context" && {count _excluded > 0}) then {
    systemChat format [
        "NOTICE: Found gear not %1: %2",
        _context,
        str _excluded
    ];
};

_gear