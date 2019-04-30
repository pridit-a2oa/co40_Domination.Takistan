#include "x_macros.sqf"
private ["_name", "_time"];

PARAMS_2(_name, _time);

if (time < _time) exitWith {
    hint format ["%1 cannot be called in for another %2 minute(s)", _name, ceil((_time - time) / 60)];
    
    false
};

true