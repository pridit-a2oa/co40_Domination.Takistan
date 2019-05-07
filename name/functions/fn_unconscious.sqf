#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

if (lifeState _unit != "UNCONSCIOUS") exitWith {};

_marker = str (_unit);
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerAlphaLocal 0.5;