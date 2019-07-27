/**
 * Debug Module - UAV Submodule
 */

#include "x_macros.sqf"
private ["_waypoint", "_marker"];

PARAMS_1(_waypoint);

if ([markerPos "UAV", [0, 0, 0]] call BIS_fnc_areEqual) exitWith {
    _marker = createMarkerLocal ["UAV", _waypoint];
    _marker setMarkerTypeLocal "DOT";
    _marker setMarkerColorLocal "ColorBlue";
};

"UAV" setMarkerPosLocal _waypoint;