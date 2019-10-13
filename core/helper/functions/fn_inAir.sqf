#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_name);

if ((position player) select 2 > 1) exitWith {
    format [
        "%1 cannot be %2 while in the air",
        _name select 0,
        _name select 1
    ];
};

true