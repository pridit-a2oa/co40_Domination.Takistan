#include "x_macros.sqf"
private ["_name", "_position", "_type", "_text", "_color", "_shape", "_size"];

PARAMS_7(_name, _position, _type, _text, _color, _shape, _size);

_marker = createMarkerLocal [_name, _position];
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal _text;
_marker setMarkerColorLocal _color;
_marker setMarkerShapeLocal _shape;

if (count _size == 2) then {
    _marker setMarkerSizeLocal _size;
};

if (isServer) then {
    X_JIPH setVariable [QGVAR(markers), (X_JIPH getVariable QGVAR(markers)) + [_this], true];
};

_marker