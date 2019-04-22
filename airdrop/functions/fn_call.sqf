#define THIS_MODULE airdrop
#include "x_macros.sqf"
private ["_drop", "_position", "_vehicle", "_aircraft", "_crew", "_marker"];
PARAMS_1(_drop);

_position = screenToWorld [0.5, 0.5];

GVAR(airdrop_smoke) createVehicle _position;

if (!isNil QMODULE(crossroad)) then {
    [_position, "airdrop"] call FUNC(crossroad,request);
};

_spawn = [_position, GVAR(airdrop_aircraft_distance), random 360] call BIS_fnc_relPos;
_spawn = [_spawn select 0, _spawn select 1, 400];

_direction = [_spawn, _position] call FUNC(client,dirTo);

_group = createGroup west;
_vehicle = [_spawn, _direction, GVAR(airdrop_aircraft), _group] call BIS_fnc_spawnVehicle;

_aircraft = _vehicle select 0;
_crew = _vehicle select 1;

[nil, nil, rExecVM, __handlerRE(vehicle), _aircraft] call RE;

_aircraft lock true;
_aircraft flyInHeight 200;

{
    _x setCaptive true;
} forEach _crew;

_area = markerPos QGVAR(area);

_start = _group addWaypoint [_position, 0];
_start setWaypointBehaviour "CARELESS";
_start setWaypointSpeed "NORMAL";
_start setWaypointType "MOVE";

_exit = [_area, 10000, _direction] call BIS_fnc_relPos;

_end = _group addWaypoint [_exit, 0];
_end setWaypointStatements ["true", "(vehicle this) setDamage 1; deleteVehicle (vehicle this)"];
_end setWaypointBehaviour "CARELESS";
_end setWaypointSpeed "NORMAL";
_end setWaypointType "MOVE";

[_aircraft, _position, _drop] spawn FUNC(THIS_MODULE,drop);