#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_position", "_direction", "_local", "_ammobox"];

PARAMS_3(_position, _direction, _local);

switch (_local) do {
    case true: {
        _ammobox = GVAR(ammobox_type) createVehicleLocal _position;
    };
    
    case false: {
        _ammobox = createVehicle [GVAR(ammobox_type), _position, [], 0, "CAN_COLLIDE"];

        [true, "execVM", [[_ammobox], __function(handle)]] call FUNC(network,mp);
        [true, "reveal", _ammobox] call FUNC(network,mp);
    };
};

[_ammobox, _local] spawn FUNC(THIS_MODULE,replenish);

_ammobox setDir _direction;
_ammobox setPos _position;

_ammobox