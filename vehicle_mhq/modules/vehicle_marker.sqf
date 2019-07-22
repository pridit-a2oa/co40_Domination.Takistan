/**
 * Vehicle MHQ Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

_marker = _vehicle getVariable QGVAR(id);
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "o_uav";

if (_vehicle getVariable QGVAR(deployed)) then {
    _marker setMarkerTextLocal (markerText _marker + " (Deployed)");
};