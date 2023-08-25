#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_save"];

_save = [];

{
    [_save, [format [__profile("%1"), _x select 0], _x select 1]] call BIS_fnc_arrayPush;
} forEach [
    ["camera", ["STRING", ["INTERNAL", "EXTERNAL"]]],
    ["sounds", ["SCALAR", [0, 1]]],
    ["grass", ["SCALAR", [50, 25, 12.5]]],
    ["nightvision", ["SCALAR", [0, 1]]],
    ["view_distance", ["SCALAR", [500, 10000]]]
];

{
    private ["_module", "_option"];

    _module = _x;
    _option = _x;

    if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {
        _module = _x select 0;
        _option = _x select 1;
    };

    if !(isNil (format [QMODULE(%1), _module])) then {
        [_save, [format [__profile("%1"), _option], ["SCALAR", [0, 1]]]] call BIS_fnc_arrayPush;
    };
} forEach [
    "3d",
    ["halo", "parachute"],
    "reward",
    "tutorial",
    "vehicle_loadout",
    "vote"
];

GVAR(profile_type_save) = GVAR(profile_type_save) + _save;

true