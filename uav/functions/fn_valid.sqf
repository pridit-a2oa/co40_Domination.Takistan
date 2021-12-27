#include "x_macros.sqf"
private ["_aircraft", "_waypoint"];

PARAMS_2(_aircraft, _waypoint);

if (!alive _aircraft) exitWith {false};
if (!canMove _aircraft) exitWith {false};
if (call FUNC(common,time) > _aircraft getVariable QGVAR(uav_airborne)) exitWith {false};
if (_aircraft distance _waypoint >= (GVAR(uav_distance_waypoint) / 3)) exitWith {false};

true