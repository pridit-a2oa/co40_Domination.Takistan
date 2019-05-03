#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_ied", "_position", "_explosive"];

PARAMS_1(_ied);

if (isNil "_ied") exitWith {};

_ied setVariable [QGVAR(exploded), true, true];

_explosive = createVehicle [GVAR(ied_type_explosion), position _ied, [], 0, "CAN_COLLIDE"];

deleteVehicle _ied;