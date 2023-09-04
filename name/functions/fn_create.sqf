#define THIS_MODULE name
#include "x_macros.sqf"
private ["_unit", "_marker"];

PARAMS_1(_unit);

_marker = createMarkerLocal [format ["player_%1", name _unit], position _unit];

_marker setMarkerTextLocal (name _unit);
_marker setMarkerPosLocal (getPosASL _x);
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "DOT";