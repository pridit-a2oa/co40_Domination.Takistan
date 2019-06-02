#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_units", "_ied", "_detonate", "_unit", "_distance", "_speed"];

PARAMS_2(_units, _ied);

_detonate = {
    _unit = if (_x != vehicle _x) then {vehicle _x} else {_x};

    _distance = _unit distance _ied <= (GVAR(ied_trigger_distances) select 0);

    if (_distance) exitWith {true};

    _speed = speed _unit > GVAR(ied_trigger_speed);

    if (_speed) exitWith {true};
    
    false
} forEach _units;

if (!_detonate) exitWith {};

true