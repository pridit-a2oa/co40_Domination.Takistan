#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

{
    deleteVehicle _x;
} forEach (_target getVariable QGVAR(cleanup));