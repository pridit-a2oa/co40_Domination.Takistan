#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

{
    if (_x isKindOf "CAManBase") then {
        _x setDamage 1;
    };

    deleteVehicle _x;

    sleep 0.2;
} forEach (_vehicle getVariable QGVAR(cleanup));