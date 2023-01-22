#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(medical) && {GVAR(medical_type_vehicles) find (typeOf _vehicle) == -1}) exitWith {false};
if (player getVariable QGVAR(inventory_medical) >= player getVariable QGVAR(inventory_medical_max)) exitWith {false};

true