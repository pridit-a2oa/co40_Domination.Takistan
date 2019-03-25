#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_position", "_direction", "_locality"];
PARAMS_3(_position,_direction,_locality);

_box = switch (_locality) do {
    case true: {"USVehicleBox_EP1" createVehicleLocal _position};
    case default {"USVehicleBox_EP1" createVehicle _position};
};

_box setDir _direction;
_box setPos _position;
player reveal _box;

_box