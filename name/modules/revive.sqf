/**
 * Name Module - Revive Submodule
 */

#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

_marker = str (_unit);
_marker setMarkerColor "ColorRed";
_marker setMarkerAlpha 0.5;

waitUntil {lifeState _unit != "UNCONSCIOUS"};

_marker setMarkerColor "ColorGreen";
_marker setMarkerAlpha 1;