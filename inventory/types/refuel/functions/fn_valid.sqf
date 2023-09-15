#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(vehicle_refuel) && {!(typeOf _vehicle in (GVAR(inventory_refuel_type) select 2))}) exitWith {false};
if (player getVariable QGVAR(inventory_refuel) >= player getVariable QGVAR(inventory_refuel_max)) exitWith {false};

true