#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(vehicle_refuel) && {GVAR(vehicle_refuel_types) find (typeOf _vehicle) == -1}) exitWith {false};
if (player getVariable QGVAR(inventory_refuel) >= player getVariable QGVAR(inventory_refuel_max)) exitWith {false};

true