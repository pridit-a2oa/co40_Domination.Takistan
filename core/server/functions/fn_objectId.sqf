#include "x_macros.sqf"
private ["_object"];

PARAMS_1(_object);

format ["%1-%2", str (getPosASL _object), diag_tickTime];