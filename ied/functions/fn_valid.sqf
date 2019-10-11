#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_units", "_ied", "_detonate"];

PARAMS_2(_units, _ied);

if ({_x getVariable QGVAR(ied) && {_x distance _ied <= 50}} count (call FUNC(common,players)) > 0) exitWith {false};

_detonate = [];

{
    private ["_unit", "_distance", "_speed", "_height", "_return"];
    
    _unit = if (_x != vehicle _x) then {vehicle _x} else {_x};
    
    _distance = _unit distance _ied <= (GVAR(ied_trigger_distances) select 0);
    _speed = speed _unit > GVAR(ied_trigger_speed);
    _height = (position _unit) select 2;
    
    _return = switch (true) do {
        case (_height > 1): {false};
        case (_distance): {true};
        case (_speed): {true};
        default {false};
    };
    
    _detonate = _detonate + [_return];
} forEach _units;

if ({str (_x) == "true"} count _detonate > 0) exitWith {true};

false