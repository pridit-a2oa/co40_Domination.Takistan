#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_save"];

_save = [
    [__profile("camera"), ["STRING", ["INTERNAL", "EXTERNAL"]]],
    [__profile("sounds"), ["SCALAR", [0, 1]]],
    [__profile("grass"), ["SCALAR", [50, 25, 10]]],
    [__profile("nightvision"), ["SCALAR", [0, 1]]],
    [__profile("view_distance"), ["SCALAR", [500, 10000]]]
];

if (!isNil QMODULE(3d)) then {
    [_save, [__profile("3d"), ["SCALAR", [0, 1]]]] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(reward)) then {
    [_save, [__profile("reward"), ["SCALAR", [0, 1]]]] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(tutorial)) then {
    [_save, [__profile("tutorial"), ["SCALAR", [0, 1]]]] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_welcome)) then {
    [_save, [__profile("vehicle_welcome"), ["SCALAR", [0, 1]]]] call BIS_fnc_arrayPush;
};

GVAR(profile_type_save) = GVAR(profile_type_save) + _save;