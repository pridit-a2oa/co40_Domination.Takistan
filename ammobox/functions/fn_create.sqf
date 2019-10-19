#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_position", "_direction", "_local"];

PARAMS_3(_position, _direction, _local);

_box = switch (_local) do {
    case true: {GVAR(ammobox_type) createVehicleLocal _position};
    case default {createVehicle [GVAR(ammobox_type), _position, [], 0, "CAN_COLLIDE"]};
};

_box setDir _direction;
_box setPos _position;

[true, "reveal", [player, _box]] call FUNC(network,mp);

_box