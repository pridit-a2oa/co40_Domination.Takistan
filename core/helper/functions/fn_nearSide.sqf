#include "x_macros.sqf"
private ["_name", "_position", "_side", "_distance"];

PARAMS_4(_name, _position, _side, _distance);

_type = if (_side == WEST) then {"friendly"} else {"enemy"};

if (_side countSide (_position nearEntities [["Man", "Air", "Car", "Tank"], _distance]) > 0) exitWith {
    format [
        "%1 cannot be called when %2 units are within %3m of target position",
        _name,
        _type,
        _distance
    ];
};

true