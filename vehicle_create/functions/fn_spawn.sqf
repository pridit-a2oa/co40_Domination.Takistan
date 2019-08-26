#include "x_macros.sqf"
private ["_vehicle", "_occupied", "_position", "_atv"];

PARAMS_1(_vehicle);

_type = (GVAR(vehicle_create_types_vehicle) select 0) select 1;

{
    if (_x select 0 == faction _vehicle) exitWith {
        _type = _x select 1;
    };
} forEach GVAR(vehicle_create_types_vehicle);

_occupied = nearestObjects [_vehicle, [_type], 8];

if (count _occupied > 0) exitWith {
    closeDialog 0;
    [_vehicle] call FUNC(vehicle_menu,show);
};

_position = _vehicle modelToWorld [-4,0,0];

_atv = createVehicle [_type, [_position select 0, _position select 1, 0], [], 0, "NONE"];
_atv setDir ((direction _vehicle) - 180);
_atv setVectorUp (vectorUp _vehicle);
_atv setPos [_position select 0, _position select 1, 0];

if (!isNil QMODULE(vehicle_respawn)) then {
    _atv setVariable [QGVAR(respawnable), false, true];
};

player reveal _atv;

[true, "say", [_atv, QGVAR(sound_build), 20]] call FUNC(network,mp);
[true, "execVM", [[_atv], __handlerRE(vehicle)]] call FUNC(network,mp);

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