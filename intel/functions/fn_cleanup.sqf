#include "x_macros.sqf"
private ["_position", "_objects"];

PARAMS_1(_position);

_objects = nearestObjects [_position, [], GVAR(intel_distance_cleanup)];

{
    if (_x isKindOf "AllVehicles") then {
        _x setDamage 1;
    } else {
        deleteVehicle _x;
    };
} forEach _objects;