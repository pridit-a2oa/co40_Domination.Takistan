#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

{
    deleteVehicle _x;
} forEach crew _vehicle;

deleteVehicle _vehicle;