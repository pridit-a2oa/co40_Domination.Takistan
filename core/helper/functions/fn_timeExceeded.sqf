#include "x_macros.sqf"
private ["_name", "_time"];

PARAMS_2(_name, _time);

if (time < _time) exitWith {
    format ["%1 cannot be %2 for another %3 minute(s)", _name select 0, _name select 1, ceil((_time - time) / 60)];
};

true