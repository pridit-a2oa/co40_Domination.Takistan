#include "x_macros.sqf"
private ["_name", "_variable"];

PARAMS_2(_name, _variable);

if (X_JIPH getVariable _variable) exitWith {
    format ["%1 already in progress", _name];
};

true