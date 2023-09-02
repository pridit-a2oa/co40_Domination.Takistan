#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_type", "_vehicle", "_time", "_max"];

PARAMS_4(_type, _vehicle, _time, _max);

_time = _time + call FUNC(common,time);

sleep 1;

while {call FUNC(common,time) < _time} do {
    // Remaining time to rebuild is greater than the maximum it could ever be
    if ((_time - call FUNC(common,time)) > _max) exitWith {
        __log format [
            "(%1) Time exceeded possible maximum, exiting %2",
            _type,
            str [_time, _time - call FUNC(common,time)]
        ]];
    };
    
    if ({_x distance _vehicle < 30} count (call FUNC(common,players)) > 0) then {
        _vehicle spawn {
            sleep (random 10);
            
            [true, "say3D", [_this, QGVAR(sound_weld), 20]] call FUNC(network,mp);
        };
    };
    
    sleep 15;
};

true