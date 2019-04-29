#include "x_macros.sqf"
private ["_spawn", "_name", "_position"];
PARAMS_1(_vehicle);

if (!alive _vehicle) exitWith {};
    
_marker = createMarkerLocal [str ((_vehicle getVariable QGVAR(position)) select 0), position _vehicle];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
_marker setMarkerAlphaLocal 0;

if (_vehicle isKindOf "Tank") exitWith {
    _marker setMarkerTypeLocal "o_armor";
};

_marker setMarkerTypeLocal "o_air";

_vehicle addMPEventHandler ["MPKilled", {
    deleteMarkerLocal (str (((_this select 0) getVariable QGVAR(position)) select 0));
}];