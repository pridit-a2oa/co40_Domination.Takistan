#include "x_macros.sqf"
private ["_name", "_has", "_requires"];

PARAMS_3(_name, _has, _requires);

if (_has < _requires) exitWith {
    format [
        "%1 cannot be %2 as you have none left",
        _name select 0,
        _name select 1
    ];
};

true