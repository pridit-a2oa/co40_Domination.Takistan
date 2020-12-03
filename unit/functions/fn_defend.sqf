
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

private ["_grp", "_pos"];

_grp = _this select 0;
_pos = _this select 1;

_grp setBehaviour "SAFE";

private ["_list", "_units"];

_list = nearestObjects [_pos, ["LandVehicle"], 50];
_units = (units _grp) - [leader _grp]; // The leader should not man defenses
_staticWeapons = [];

{
    if ((_x emptyPositions "gunner") > 0) then {
        _staticWeapons = _staticWeapons + [_x];
    };
    
    _leader = leader _grp;
    
    if (vehicle _leader == _leader && {(_x emptyPositions "driver") > 0} && {locked _x}) then {
        _leader assignAsDriver _x;
        _leader moveInDriver _x;
        _leader disableAI "MOVE";
    };
} forEach _list;

// Have the group man most empty static defenses
{    
    // Are there still units available?
    if ({(vehicle _x) == _x} count _units > 0) then {
        private ["_unit"];
        
        _unit = (_units select ((count _units) - 1));
        
        if ((_x emptyPositions "gunner") > 0) then {
            _unit assignAsGunner _x;
            _unit moveInGunner _x;
        };
        
        _units resize ((count _units) - 1);
    };
} forEach _staticWeapons;

// Give the rest a guard WP.
private ["_wp"];

_wp = _grp addWaypoint [_pos, 10];
_wp setWaypointType "GUARD";

private ["_handle"];

_handle = _units spawn {
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