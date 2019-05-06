#include "x_macros.sqf"
private ["_name", "_time", "_format"];

PARAMS_2(_name, _time);

if (time < _time) exitWith {
    if (_time - time > 60) then {
        _time = (_time - time) / 60;
        _format = "minutes";
    } else {
        _time = _time - time;
        _format = "second(s)";
    };
    
    format ["%1 cannot be %2 for another %3 %4", _name select 0, _name select 1, ceil (_time), _format];
};

true