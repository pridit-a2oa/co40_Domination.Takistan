#define THIS_MODULE heap
#include "x_macros.sqf"
private ["_position", "_direction", "_heap"];

PARAMS_2(_position, _direction);

_heap = GVAR(heap_type) createVehicleLocal _position;

_heap setDir _direction;
_heap setPos _position;

_heap addAction [
    "Discard" call FUNC(common,RedText),
    __function(drop),
    [],
    10,
    false,
    true,
    "",
    "!isNull unitBackpack player && {[player] call d_fnc_common_ready}"
];

player reveal _heap;

[_heap] call FUNC(THIS_MODULE,list);