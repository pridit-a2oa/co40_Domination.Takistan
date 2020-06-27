#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_position", "_direction", "_local", "_box"];

PARAMS_3(_position, _direction, _local);

switch (_local) do {
    case true: {
        _box = GVAR(ammobox_type) createVehicleLocal _position;
    };
    
    case false: {
        _box = createVehicle [GVAR(ammobox_type), _position, [], 0, "CAN_COLLIDE"];
        
        [_box] call FUNC(THIS_MODULE,replenish);
        
        [true, "execVM", [[_box], __function(handle)]] call FUNC(network,mp);
        [true, "reveal", _box] call FUNC(network,mp);
    };
};

_box setDir _direction;
_box setPos _position;

_box