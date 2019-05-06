#include "x_macros.sqf"
private ["_tow"];

_tower = _this select 0;
_tow = _this select 3;

_tower setVariable [QGVAR(is_towing), false, true];
_tow setVariable [QGVAR(is_towed), false, true];