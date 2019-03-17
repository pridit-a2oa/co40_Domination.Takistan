/**
 * Marker Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (_vehicle isKindOf "Air") then {
    _marker = createMarkerLocal [str ((position _vehicle) select 0), position _vehicle];
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
    _marker setMarkerTypeLocal "o_air";
};