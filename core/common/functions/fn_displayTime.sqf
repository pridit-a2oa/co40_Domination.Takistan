#include "x_macros.sqf"
private ["_time", "_minute", "_second"];

PARAMS_1(_time);

_minute = floor ((round _time) / 60);
_second = (round _time) % 60;

if (_minute < 10) then {
    _minute = format ["0%1", _minute];
};

if (_second < 10) then {
    _second = format ["0%1", _second];
};

format ["%1:%2", _minute, _second]