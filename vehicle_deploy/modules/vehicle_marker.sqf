/**
 * Vehicle Deploy Module - Vehicle Marker Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (typeName ([_vehicle] call FUNC(THIS_MODULE,type)) == "SCALAR") exitWith {};
if !(alive _vehicle) exitWith {};

_marker = _vehicle getVariable QGVAR(id);

if ((_vehicle getVariable QGVAR(deployed)) select 0) then {
    _marker setMarkerColorLocal "ColorYellow";
    _marker setMarkerTextLocal (markerText _marker + " (Deployed)");
} else {
    _marker setMarkerColorLocal "ColorBlack";
    _marker setMarkerAlphaLocal 0;
};