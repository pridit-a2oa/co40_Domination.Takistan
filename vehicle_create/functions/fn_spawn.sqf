#include "x_macros.sqf"
private ["_vehicle", "_occupied", "_position", "_atv"];

PARAMS_1(_vehicle);

_type = (GVAR(vehicle_create_types_vehicle) select 0) select 1;

{
    if (_x select 0 == typeOf _vehicle) exitWith {
        _type = _x;
    };
} forEach GVAR(vehicle_create_types_vehicle);

_occupied = nearestObjects [_vehicle, [_type select 1], 15];

if (count _occupied > 0) exitWith {
    hint format [
        "%1 already in close proximity",
        [_type select 1] call FUNC(vehicle,name)
    ];

    closeDialog 0;
    
    [_vehicle] call FUNC(vehicle_menu,show);
};

_position = _vehicle modelToWorld (_type select 2);

_atv = createVehicle [_type select 1, [_position select 0, _position select 1, 0], [], 0, "NONE"];
_atv setDir ((direction _vehicle) - 180);
_atv setVectorUp (vectorUp _vehicle);
_atv setPos [_position select 0, _position select 1, 0];

if (!isNil QMODULE(vehicle_respawn)) then {
    _atv setVariable [QGVAR(respawnable), false, true];
};

player reveal _atv;

[true, "say", [_atv, QGVAR(sound_build), 20]] call FUNC(network,mp);
[true, "execVM", [[_atv], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

_atv spawn {
    sleep 10;
    
    while {true} do {
        _far = {_x distance _this < GVAR(vehicle_distance)} count (call FUNC(common,players)) < 1;
        
        if (_far && {_this call FUNC(common,empty)}) exitWith {
            deleteVehicle _this;
        };
        
        sleep 5;
    };
};

closeDialog 0;