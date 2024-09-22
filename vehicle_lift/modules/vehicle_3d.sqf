/**
 * Vehicle Lift Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_string"];

PARAMS_1(_vehicle);

_string = "";

{
    if (_vehicle in (_x select 1)) exitWith {
        _string = format ["<br />%1 Lift", _x select 0]
    };
} forEach GVAR(vehicle_lift_types);

_string