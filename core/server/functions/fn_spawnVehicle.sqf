#include "x_macros.sqf"
private ["_position", "_type", "_distance", "_height", "_side", "_direction", "_spawn", "_group", "_vehicle", "_object", "_crew"];

PARAMS_6(_position, _type, _distance, _height, _side, _direction);

_spawn = [_position, _distance, random 360] call BIS_fnc_relPos;
_spawn = [_spawn select 0, _spawn select 1, _height];

if (isNil "_direction") then {
    _direction = [_spawn, _position] call BIS_fnc_dirTo;
};

_group = createGroup _side;
_vehicle = [_spawn, _direction, _type, _group] call BIS_fnc_spawnVehicle;

_object = _vehicle select 0;
_crew = _vehicle select 1;

_object setDir _direction;
_object setFormDir _direction;
_object allowCrewInImmobile true;

_object spawn {
    if (!isNil QMODULE(vehicle_respawn)) then {
        _this setVariable [QGVAR(respawnable), false, true];
    };
    
    [true, "execVM", [[_this], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
};

_vehicle