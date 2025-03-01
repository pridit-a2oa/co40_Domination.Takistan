#include "x_macros.sqf"
private ["_vehicle", "_group", "_waypoint"];

PARAMS_1(_vehicle);

_group = group _vehicle;

[_group, (currentWaypoint _group)] setWaypointPosition [getPosASL _vehicle, -1];

sleep 0.1;

for "_i" from count waypoints _group - 1 to 0 step -1 do {
    deleteWaypoint [_group, _i];
};

_waypoint = _group addWaypoint [[markerPos QGVAR(map_zone), 9500, getDir _vehicle] call BIS_fnc_relPos, 0];
_waypoint setWaypointStatements ["true", "[vehicle this] spawn d_fnc_vehicle_delete"];
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointType "MOVE";