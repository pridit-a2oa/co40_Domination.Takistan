#define THIS_MODULE base_backpack
#include "x_macros.sqf"
private ["_heap"];

PARAMS_1(_heap);

{
    _name = [_x] call FUNC(vehicle,name);
    _heap addAction [format ["Take %1", _name], __function(take), _x];
} forEach GVAR(base_backpack_types);