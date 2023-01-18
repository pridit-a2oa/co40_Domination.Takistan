#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_position", "_radius", "_ieds"];

PARAMS_2(_position, _radius);

_roads = _position nearRoads _radius;

_ieds = [];

for "_i" from 1 to (floor ((count _roads) / 25) - 1) do {
    private ["_road"];
    
    _road = _roads select (25 * _i);

    [_ieds, [_road] call FUNC(THIS_MODULE,create)] call BIS_fnc_arrayPush;

    sleep 0.5;
};

_ieds