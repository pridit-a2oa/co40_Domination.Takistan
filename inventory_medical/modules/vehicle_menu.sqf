/**
 * Inventory Medical Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (player getVariable QGVAR(medkits) >= player getVariable QGVAR(medkits_max)) exitWith {false};
if (!isNil QMODULE(medical) && {GVAR(medical_type_vehicles) find (typeOf _vehicle) == -1}) exitWith {false};

["Medkit: Take", "inv_medkit"] call FUNC(vehicle_menu,populate);

true