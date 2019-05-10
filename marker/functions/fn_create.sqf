#include "x_macros.sqf"
private ["_name", "_position", "_type", "_text", "_color"];

PARAMS_5(_name, _position, _type, _text, _color);

_marker = createMarker [_name, _position];
_marker setMarkerType _type;
_marker setMarkerText _text;
_marker setMarkerColor _color;

X_JIPH setVariable [QGVAR(markers), (X_JIPH getVariable QGVAR(markers)) + [_this], true];

_marker