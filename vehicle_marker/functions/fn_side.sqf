#include "x_macros.sqf"
private ["_side", "_color"];

PARAMS_1(_side);

_color = switch (_side) do {
    case west;
    case civilian: {
        "Blue"
    };

    case east;
    case resistance: {
        "Red"
    };
};

format ["Color%1", _color]