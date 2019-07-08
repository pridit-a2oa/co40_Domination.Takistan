#include "x_macros.sqf"
private ["_position", "_type", "_distance", "_height", "_group", "_spawn", "_direction", "_vehicle"];

PARAMS_6(_position, _type, _distance, _height, _group, _direction);

_spawn = [_position, _distance, random 360] call BIS_fnc_relPos;
_spawn = [_spawn select 0, _spawn select 1, _height];

if (isNil "_direction") then {
    _direction = [_spawn, _position] call BIS_fnc_dirTo;
};

_group = createGroup _group;
_vehicle = [_spawn, _direction, _type, _group] call BIS_fnc_spawnVehicle;

(_vehicle select 0) setDir _direction;
(_vehicle select 0) setFormDir _direction;
(_vehicle select 0) allowCrewInImmobile true;

[_vehicle select 0] spawn {
    private ["_vehicle"];
    
    PARAMS_1(_vehicle);
    
    sleep 10;
    
    if (!isNil QMODULE(vehicle_respawn)) then {
        _vehicle setVariable [QGVAR(respawnable), false, true];
    };
    
    [nil, nil, rExecVM, __handlerRE(vehicle), _vehicle] call RE;
};

_vehicle