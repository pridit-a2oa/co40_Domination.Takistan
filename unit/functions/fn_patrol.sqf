/**
 * Original Author: DetrimentalDave
 *
 * Description:
 * I wrote a replacement for BIS_fnc_taskPatrol, because it sucked.
 */

#include "x_macros.sqf"
private ["_group", "_position", "_range", "_waypoints"];

PARAMS_4(_group, _position, _range, _waypoints);

for "_i" from 1 to _waypoints do {
    _distance = random _range;
    _wdir = random 360;
    _wx = (_start select 0) + (_distance * (sin _wdir));
    _wy = (_start select 1) + (_distance * (cos _wdir));
    _wp = _group addWaypoint [[_wx,_wy] , 10, _i];

    if (_i == 1) then {
        [_group, _i] setWaypointBehaviour "SAFE";
        [_group, _i] setWaypointCombatMode "RED";
        [_group, _i] setWaypointFormation "COLUMN";
    };
};

_wp = _group addWaypoint [_start, 10, _waypoints];

[_group, _waypoints] setWaypointType "CYCLE";