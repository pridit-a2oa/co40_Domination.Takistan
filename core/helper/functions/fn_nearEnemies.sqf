#include "x_macros.sqf"
private ["_name", "_position", "_source", "_distance", "_near"];

PARAMS_4(_name, _position, _source, _distance);

_near = _position nearEntities [["Man", "Air", "Car", "Tank"], _distance];

if ((_source findNearestEnemy _position) in _near) exitWith {
    hint format ["%1 cannot be called when enemies are nearby", _name];
    
    false
};

true