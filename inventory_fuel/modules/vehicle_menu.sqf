/**
 * Inventory Fuel Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (player getVariable QGVAR(fuel_cans) >= player getVariable QGVAR(fuel_cans_max)) exitWith {false};
if (!isNil QMODULE(vehicle_refuel) && {GVAR(vehicle_refuel_types) find (typeOf _vehicle) == -1}) exitWith {false};

["Fuel Can: Take", "inv_fuel_can"] call FUNC(vehicle_menu,populate);

true