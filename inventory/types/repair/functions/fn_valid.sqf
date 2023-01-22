#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(vehicle_repair) && {GVAR(vehicle_repair_types) find (typeOf _vehicle) == -1}) exitWith {false};
if (player getVariable QGVAR(inventory_repair) >= player getVariable QGVAR(inventory_repair_max)) exitWith {false};

true