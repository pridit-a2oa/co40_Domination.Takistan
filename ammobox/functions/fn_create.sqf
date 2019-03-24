#include "x_macros.sqf"
private ["_position", "_direction"];
PARAMS_2(_position,_direction);

_box = "USVehicleBox_EP1" createVehicleLocal _position;
_box setDir _direction;
_box setPos _position;
player reveal _box;

_box