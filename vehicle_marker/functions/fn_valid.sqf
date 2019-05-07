#include "x_macros.sqf"
private ["_vehicle", "_name", "_position"];

PARAMS_1(_vehicle);

_name = (str ((_vehicle getVariable QGVAR(position)) select 0));
_position = markerPos _name;

if (isNil "_position") exitWith {};

_name