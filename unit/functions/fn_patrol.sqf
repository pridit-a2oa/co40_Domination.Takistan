/**
 * Original Author: DetrimentalDave
 * https://www.reddit.com/r/armadev/comments/1k62se/i_wrote_a_replacement_for_bis_fnc_taskpatrol/
 */

#include "x_macros.sqf"
private ["_group", "_position", "_range", "_waypoints", "_distance", "_wdir", "_wx", "_wy", "_wp", "_vehicle"];

PARAMS_4(_group, _position, _range, _waypoints);

for "_i" from 1 to _waypoints do {
    _distance = random _range;
    _wdir = random 360;
    _wx = (_position select 0) + (_distance * (sin _wdir));
    _wy = (_position select 1) + (_distance * (cos _wdir));
    _wp = _group addWaypoint [[_wx,_wy] , 10, _i];

    if ([_i, 1] call BIS_fnc_areEqual) then {
        _vehicle = vehicle (leader _group);

        [_group, _i] setWaypointBehaviour "SAFE";
        [_group, _i] setWaypointCombatMode "RED";
        [_group, _i] setWaypointFormation "COLUMN";
        [_group, _i] setWaypointSpeed (if (_vehicle isKindOf "Air" && {(faction _vehicle) in ["BIS_TK", "BIS_TK_INS"]}) then {"NORMAL"} else {"LIMITED"});
    };
};

_wp = _group addWaypoint [_position, 10, _waypoints];

[_group, _waypoints] setWaypointType "CYCLE";