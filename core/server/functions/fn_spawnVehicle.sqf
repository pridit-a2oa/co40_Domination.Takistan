#include "x_macros.sqf"
private ["_position", "_type", "_distance", "_height", "_side", "_direction", "_spawn", "_vehicle", "_object", "_crew", "_group"];

PARAMS_6(_position, _type, _distance, _height, _side, _direction);

_spawn = [_position, _distance, random 360] call BIS_fnc_relPos;
_spawn = [_spawn select 0, _spawn select 1, _height];

if (isNil "_direction") then {
    _direction = [_spawn, _position] call BIS_fnc_dirTo;
};

_vehicle = [_spawn, _direction, _type, _side] call BIS_fnc_spawnVehicle;

_object = _vehicle select 0;
_crew = _vehicle select 1;
_group = _vehicle select 2;

X_JIPH setVariable [QGVAR(groups), (X_JIPH getVariable QGVAR(groups)) + [_group], true];

if ([_height, 0] call BIS_fnc_areEqual) then {
    _object setVelocity [0, 0, 0];
};

{
    __addDead(_x);
} forEach _crew;

_object setDir _direction;
_object setFormDir _direction;

if ([faction _object, "BIS_US"] call BIS_fnc_areEqual) then {
    _object allowCrewInImmobile true;
};

if (!isNil QMODULE(vehicle_respawn)) then {
    _object setVariable [QGVAR(respawnable), false, true];
};

[true, "execVM", [[_object], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

_vehicle