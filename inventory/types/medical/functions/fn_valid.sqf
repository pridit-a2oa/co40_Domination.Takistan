#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(medical) && {!(typeOf _vehicle in (GVAR(inventory_medical_type) select 2))}) exitWith {false};
if (player getVariable QGVAR(inventory_medical) >= player getVariable QGVAR(inventory_medical_max)) exitWith {false};

true