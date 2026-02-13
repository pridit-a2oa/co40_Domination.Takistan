#include "x_macros.sqf"
private ["_name", "_position", "_type", "_text", "_color", "_alpha", "_shape", "_brush", "_size"];

PARAMS_9(_name, _position, _type, _text, _color, _alpha, _shape, _brush, _size);

_marker = createMarkerLocal [_name, _position];
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal _text;
_marker setMarkerColorLocal _color;
_marker setMarkerAlphaLocal _alpha;
_marker setMarkerShapeLocal _shape;

if !([_brush, ""] call BIS_fnc_areEqual) then {
    _marker setMarkerBrushLocal _brush;
};

if ([count _size, 2] call BIS_fnc_areEqual) then {
    _marker setMarkerSizeLocal _size;
};

if (isServer) then {
    X_JIP setVariable [QGVAR(markers), (X_JIP getVariable QGVAR(markers)) + [_this], true];
};

_marker