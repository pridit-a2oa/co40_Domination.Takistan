/**
 * Inventory Repair - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (player getVariable QGVAR(repair_kits) >= player getVariable QGVAR(repair_kits_max)) exitWith {false};
if (!isNil QMODULE(vehicle_repair) && {GVAR(vehicle_repair_types) find (typeOf _vehicle) == -1}) exitWith {false};

["Repair Kit: Take", "inv_repair_kit"] call FUNC(vehicle_menu,populate);

true