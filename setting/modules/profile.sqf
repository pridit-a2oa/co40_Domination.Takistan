#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_save"];

_save = [];

{
    [_save, [format [__profile("%1"), _x select 0], _x select 1]] call BIS_fnc_arrayPush;
} forEach [
    ["camera", ["STRING", ["INTERNAL", "EXTERNAL"]]],
    ["sounds", ["SCALAR", [0, 1]]],
    ["grass", ["SCALAR", [50, 25, 10]]],
    ["nightvision", ["SCALAR", [0, 1]]],
    ["view_distance", ["SCALAR", [500, 10000]]]
];

{
    if !(isNil (format [QMODULE(%1), _x])) then {
        [_save, [format [__profile("%1"), _x], ["SCALAR", [0, 1]]]] call BIS_fnc_arrayPush;
    };
} forEach [
    "3d",
    "reward",
    "tutorial",
    "vehicle_welcome"
];

GVAR(profile_type_save) = GVAR(profile_type_save) + _save;