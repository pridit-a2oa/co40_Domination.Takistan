#define THIS_MODULE airdrop
#include "x_macros.sqf"
private ["_position", "_vehicle", "_aircraft", "_crew", "_marker"];

_position = screenToWorld [0.5, 0.5];

if (!isNil QMODULE(crossroad)) then {
    [_position, "airdrop"] call FUNC(crossroad,request);
};

_spawn = [_position, GVAR(airdrop_aircraft_radius), random 360] call BIS_fnc_relPos;
_spawn = [_spawn select 0, _spawn select 1, 400];

_direction = [_spawn, _position] call FUNC(client,dirTo);

_group = createGroup west;
_vehicle = [_spawn, _direction, GVAR(airdrop_aircraft), _group] call BIS_fnc_spawnVehicle;

_aircraft = _vehicle select 0;
_crew = _vehicle select 1;

{
    _x setCaptive true;
} forEach _crew;

_aircraft lock true;

[_aircraft] __module(vehicle);

_waypoint = _group addWaypoint [_position, 0];
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointType "MOVE";

[_aircraft, _position] spawn FUNC(THIS_MODULE,drop);