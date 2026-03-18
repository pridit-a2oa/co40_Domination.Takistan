/**
 * Vehicle Lift Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_array"];

PARAMS_1(_vehicle);

_array = [];

{
    if (_vehicle in (_x select 1)) then {
        _array = _array + [_x select 0]
    };
} forEach GVAR(vehicle_lift_types);

_array