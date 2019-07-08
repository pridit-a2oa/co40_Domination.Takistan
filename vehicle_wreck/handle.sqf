/**
 * Vehicle Wreck Module (Handler)
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"
private ["_trigger", "_name", "_position", "_marker"];

if (isServer) then {
    GVAR(vehicle_wreck_types) = [];

    {
        GVAR(vehicle_wreck_types) = GVAR(vehicle_wreck_types) + [_x select 1];
    } forEach GVAR(vehicle_wreck_time_rebuild);
    
    _trigger = createTrigger ["EmptyDetector", position GVAR(service_wreck)];
    _trigger setTriggerArea [8, 8, 0, false];
    _trigger setTriggerActivation ["ANY", "PRESENT", true];
    _trigger setTriggerStatements [
        "call d_fnc_vehicle_wreck_valid",
        "0 = [d_rebuild] spawn d_fnc_vehicle_wreck_service",
        ""
    ];
    
    GVAR(service_wreck) setVariable [QGVAR(time), 0, true];
};

if (hasInterface) then {
    _name = "Wreck Service";
    _position = position GVAR(service_wreck);
    
    _marker = createMarkerLocal ["wreck_service", _position];
    _marker setMarkerTextLocal _name;
    _marker setMarkerColorLocal "ColorYellow";
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "DOT";
    
    if (!isNil QMODULE(3d)) then {
        [
            GVAR(service_wreck),
            _name call FUNC(common,YellowText),
            [],
            true,
            true
        ] spawn FUNC(3d,create);
    };
};