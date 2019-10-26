#define THIS_MODULE heap
#include "x_macros.sqf"
private ["_position", "_direction"];

PARAMS_2(_position, _direction);

if (hasInterface) then {
    _heap = GVAR(heap_type) createVehicleLocal _position;
    
    _heap setDir _direction;
    _heap setPos _position;
    
    _heap addAction [
        "Drop" call FUNC(common,RedText),
        __function(drop),
        [],
        10,
        false,
        true,
        "",
        "!isNull unitBackpack player"
    ];

    player reveal _heap;

    [_heap] call FUNC(THIS_MODULE,list);
};