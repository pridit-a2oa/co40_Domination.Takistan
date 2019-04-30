#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_name);

if (vehicle player != player) exitWith {
    hint format ["%1 cannot be called in from within a vehicle", _name];
    
    false
};

true