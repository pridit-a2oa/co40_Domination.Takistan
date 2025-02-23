#define THIS_MODULE heap
#include "x_macros.sqf"
private ["_heap"];

PARAMS_1(_heap);

{
    _heap addAction [
        format ["Take %1", [_x] call FUNC(vehicle,name)],
        __function(take),
        _x,
        1.5,
        true,
        false,
        "",
        ""
    ];
} forEach GVAR(heap_type_backpacks);