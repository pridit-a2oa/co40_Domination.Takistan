/**
 * Vehicle MHQ Module - Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (typeOf _vehicle == GVAR(vehicle_mhq)) then {
    _marker = createMarkerLocal [str ((position _vehicle) select 0), position _vehicle];
    _marker setMarkerColorLocal "ColorYellow";
    _marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
    _marker setMarkerTypeLocal "o_uav";
};