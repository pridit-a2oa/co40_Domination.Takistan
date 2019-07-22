#include "x_macros.sqf"
private ["_object"];

PARAMS_1(_object);

format ["%1-%2", typeOf _object, diag_tickTime];