/**
 * Vehicle Pack Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_pack_types)) exitWith {false};

[
    format [
        "%1: %2",
        if (_vehicle isKindOf "Plane") then {"Wings"} else {"Main Rotor"},
        "Fold/Unfold"
    ],
    "pack"
] call FUNC(menu,populate);

true