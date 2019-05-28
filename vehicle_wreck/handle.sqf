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
    
    _trigger = createTrigger ["EmptyDetector", markerPos QGVAR(service_wreck)];
    _trigger setTriggerArea [8, 8, 0, false];
    _trigger setTriggerActivation ["ANY", "PRESENT", true];
    _trigger setTriggerStatements [
        "this && {call d_fnc_vehicle_wreck_valid}",
        "0 = [d_rebuild] spawn d_fnc_vehicle_wreck_service",
        ""
    ];
};

if (hasInterface) then {
    _name = "Wreck Service";
    _position = markerPos QGVAR(service_wreck);
    
    _marker = createMarkerLocal ["wreck_service_1", _position];
    _marker setMarkerTextLocal "Wreck Service";
    _marker setMarkerColorLocal "ColorYellow";
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "DOT";
    
    if (!isNil QMODULE(3d)) then {
        [_position, _name] __submoduleVM(3d);
    };
};