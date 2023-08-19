#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

{
    if (alive _x) exitWith {
        deleteVehicle _x;
    };

    _x setDamage 1;
} forEach crew _vehicle;

deleteVehicle _vehicle;