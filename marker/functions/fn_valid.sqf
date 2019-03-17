#include "x_macros.sqf"
private ["_spawn", "_name", "_position"];
PARAMS_1(_vehicle);

_spawn = _vehicle getVariable QGVAR(position);

if (isNil "_spawn") exitWith {};

_name = (str ((_spawn) select 0));
_position = markerPos _name;

if (isNil "_position") exitWith {};

_name