#include "x_macros.sqf"
private ["_position", "_radius"];

PARAMS_2(_position, _radius);

_roads = _position nearRoads _radius;

_roads