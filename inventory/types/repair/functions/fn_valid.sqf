#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(vehicle_repair) && {!(typeOf _vehicle in (GVAR(inventory_repair_type) select 2))}) exitWith {false};
if (player getVariable QGVAR(inventory_repair) >= player getVariable QGVAR(inventory_repair_max)) exitWith {false};

true