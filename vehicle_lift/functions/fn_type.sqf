#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_1(_vehicle);

_type = {
    if ((typeOf _vehicle) in (_x select 1)) exitWith {
        [_x select 2, _x select 3]
    };
} forEach GVAR(vehicle_lift_types);

_type