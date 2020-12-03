#include "x_macros.sqf"
private ["_name", "_position", "_distance"];

PARAMS_3(_name, _position, _distance);

_building = round (_position distance (nearestBuilding _position));

if (_building <= _distance) exitWith {
    format [
        "%1 can only be %2 in excess of %3m from the closest building, it must be at least a further %4m away",
        _name select 0,
        _name select 1,
        _distance,
        str (_distance - _building)
    ];
};

true