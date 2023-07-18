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
        "[player] call d_fnc_common_ready"
    ];
} forEach GVAR(heap_type_backpacks);