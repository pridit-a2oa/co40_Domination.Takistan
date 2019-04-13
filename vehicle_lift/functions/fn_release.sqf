#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

_attacher removeAction (_this select 2);

detach _attachee;

_attacher setVariable [QGVAR(attached), false];