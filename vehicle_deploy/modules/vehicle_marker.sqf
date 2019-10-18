/**
 * Vehicle Deploy Module - Vehicle Marker Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (typeName ([_vehicle] call FUNC(THIS_MODULE,type)) == "SCALAR") exitWith {};

_marker = _vehicle getVariable QGVAR(id);
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "o_uav";

if (_vehicle getVariable QGVAR(deployed)) then {
    _marker setMarkerTextLocal (markerText _marker + " (Deployed)");
};