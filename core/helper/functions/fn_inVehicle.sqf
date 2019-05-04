#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_name);

if (vehicle player != player) exitWith {
    format ["%1 cannot be %2 from within a vehicle", _name select 0, _name select 1];
};

true