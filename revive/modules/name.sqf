/**
 * Revive Module - Name Submodule
 */

#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

if !(_unit getVariable QGVAR(unconscious)) exitWith {false};

_marker = str _unit;
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerAlphaLocal 0.6;

true