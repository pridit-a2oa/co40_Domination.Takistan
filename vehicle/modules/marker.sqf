/**
 * Marker Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (!alive _vehicle) exitWith {};

{
    if (typeOf _vehicle isKindOf _x) exitWith {
        waitUntil {!isNil {_vehicle getVariable QGVAR(position)}};
        
        _marker = createMarkerLocal [str ((_vehicle getVariable QGVAR(position)) select 0), position _vehicle];
        _marker setMarkerColorLocal "ColorBlue";
        _marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
        _marker setMarkerAlphaLocal 0;
        
        if (_vehicle isKindOf "Tank") exitWith {
            _marker setMarkerTypeLocal "o_armor";
        };
        
        _marker setMarkerTypeLocal "o_air";
    };
} forEach GVAR(vehicle_marker_types);