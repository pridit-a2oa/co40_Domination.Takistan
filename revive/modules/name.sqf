/**
 * Revive Module - Name Submodule
 */

#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

_marker = str (_unit);

if (lifeState _unit == "UNCONSCIOUS") exitWith {
    _marker setMarkerColor "ColorRed";
    _marker setMarkerAlpha 0.5;
};

_marker setMarkerColor "ColorGreen";
_marker setMarkerAlpha 1;