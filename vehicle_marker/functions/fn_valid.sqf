#include "x_macros.sqf"
private ["_vehicle", "_name", "_position"];

PARAMS_1(_vehicle);

_id = _vehicle getVariable QGVAR(id);
_position = markerPos _id;

if (isNil "_position") exitWith {};

_id