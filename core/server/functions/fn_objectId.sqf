#include "x_macros.sqf"
private ["_object"];

PARAMS_1(_object);

format ["%1%2%3", str diag_tickTime, typeOf _object, str (getPosASL _object)];