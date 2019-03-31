/**
 * Vehicle Wreck Module - Base Wreck Submodule
 */

#include "x_macros.sqf"
private ["_marker", "_position", "_hangar", "_hangars"];

if (isServer) then {
    X_JIPH setVariable [QGVAR(wreck_hangars), [], true];
    
    for "_i" from 1 to GVAR(wreck_hangars_max) do {
        _marker = format [QGVAR(wreck_hangar_%1), _i];
        _position = markerPos _marker;
        
        if (str _position == "[0,0,0]") exitWith {};
        
        _hangar = createVehicle [GVAR(wreck_hangar_model), _position, [], 0, "NONE"];
        _hangar setDir (markerDir _marker);
        
        X_JIPH setVariable [QGVAR(wreck_hangars), (X_JIPH getVariable QGVAR(wreck_hangars)) + [_hangar], true];
    };
};

if (hasInterface) then {
    _hangars = X_JIPH getVariable QGVAR(wreck_hangars);
    
    _hangars spawn {
        waitUntil {count _this == GVAR(wreck_hangars_max)};
        
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach _this;
    };
};