/**
 * Marker Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (_vehicle isKindOf "Air" && {alive _vehicle} && {!isNil {_vehicle getVariable QGVAR(position)}}) then {
    _marker = createMarkerLocal [str ((_vehicle getVariable QGVAR(position)) select 0), position _vehicle];
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
    _marker setMarkerTypeLocal "o_air";
    _marker setMarkerAlphaLocal 0;
};