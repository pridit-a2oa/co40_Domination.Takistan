#include "x_macros.sqf"
private ["_name", "_vehicle"];

PARAMS_2(_name, _vehicle);

if (damage _vehicle > 0.3 || {!canMove _vehicle}) exitWith {
    format [
        "%1 cannot be %2 as it is too damaged",
        _name select 0,
        _name select 1
    ];
};

true