
/*
    File: taskDefend.sqf
    Author: Joris-Jan van 't Land

    Description:
    Group will man nearby static defenses and guard the position.

    Parameter(s):
    _this select 0: group (Group)
    _this select 1: defense position (Array)
    
    Returns:
    Boolean - success flag
*/

private ["_group", "_position"];

_group = _this select 0;
_position = _this select 1;

_group setBehaviour "SAFE";

private ["_list", "_units", "_statics"];

_list = nearestObjects [_position, ["LandVehicle"], 50];
_units = (units _group) - [leader _group]; // The leader should not man defenses
_statics = [];

{
    private ["_leader"];

    if ((_x emptyPositions "gunner") > 0) then {
        [_statics, _x] call BIS_fnc_arrayPush;
    };
    
    _leader = leader _group;
    
    if ([vehicle _leader, _leader] call BIS_fnc_areEqual && {(_x emptyPositions "driver") > 0} && {locked _x}) then {
        _leader assignAsDriver _x;
        _leader moveInDriver _x;
        _leader disableAI "MOVE";
    };
} forEach _list;

// Have the group man most empty static defenses
{
    // Are there still units available?
    if ({[vehicle _x, _x] call BIS_fnc_areEqual} count _units > 0) then {
        private ["_unit"];
        
        _unit = (_units select ((count _units) - 1));
        
        if ((_x emptyPositions "gunner") > 0) then {
            _unit assignAsGunner _x;
            _unit moveInGunner _x;
        };
        
        _units resize ((count _units) - 1);
    };
} forEach _statics;

private ["_waypoint"];

_waypoint = _group addWaypoint [_position, 10];
_waypoint setWaypointType "HOLD";

_units spawn {
    sleep 5;
    
    // Make some of the remaining unit sit down.
    {
        if ((random 1) > 0.4) then {
            doStop _x;
            
            sleep 0.5;
            
            _x action ["SitDown", _x];
        };
    } forEach _this;
};

true