#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_waypoint = (group (driver _aircraft)) addWaypoint [[markerPos QGVAR(map_zone), 9500, getDir _vehicle] call BIS_fnc_relPos, 0];
_waypoint setWaypointStatements ["true", "_vehicle = vehicle this; {deleteVehicle _x} forEach crew _vehicle; _vehicle setDamage 1; deleteVehicle _vehicle"];
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointType "MOVE";