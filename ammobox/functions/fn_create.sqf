#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_position", "_direction", "_locality"];

PARAMS_3(_position, _direction, _locality);

_box = switch (_locality) do {
    case true: {GVAR(ammobox_type) createVehicleLocal _position};
    case default {GVAR(ammobox_type) createVehicle _position};
};

_box setDir _direction;
_box setPos _position;

[true, "reveal", [player, _box]] call FUNC(network,mp);

_box