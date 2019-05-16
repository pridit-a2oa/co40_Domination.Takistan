#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle setVariable [QGVAR(towing), objNull, true];
_vehicle setVariable [QGVAR(action), false, true];

(_this select 3) setVariable [QGVAR(towed), false, true];