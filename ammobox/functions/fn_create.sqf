#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_position", "_direction", "_locality"];

PARAMS_3(_position,_direction,_locality);

_box = switch (_locality) do {
    case true: {GVAR(ammobox_type) createVehicleLocal _position};
    case default {GVAR(ammobox_type) createVehicle _position};
};

_box setDir _direction;
_box setPos _position;

[nil, nil, rSpawn, [_box], {player reveal (_this select 0)}] call RE;

_box