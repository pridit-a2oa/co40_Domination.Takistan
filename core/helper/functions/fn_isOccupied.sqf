#include "x_macros.sqf"
private ["_name", "_vehicle"];

PARAMS_2(_name, _vehicle);

if ({alive _x} count crew _vehicle > 0) exitWith {
    format [
        "%1 cannot be %2 when occupied",
        _name select 0,
        _name select 1
    ];
};

true