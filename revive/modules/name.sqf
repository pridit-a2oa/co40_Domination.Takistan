/**
 * Revive Module - Name Submodule
 */

#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

_marker = str (_unit);

if (lifeState _unit == "UNCONSCIOUS") exitWith {
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerAlphaLocal 0.5;
};

_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerAlphaLocal 1;