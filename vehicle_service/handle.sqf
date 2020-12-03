/**
 * Vehicle Service Module (Handler)
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_object", "_name", "_trigger", "_marker"];

{
    _object = call compile format ["d_service_%1", _x select 0];
    _name = format ["%1 Service", _x select 1];
    
    if (isServer) then {
        _trigger = createTrigger ["EmptyDetector", position _object];
        _trigger setVariable ["object", _object];
        _trigger setVariable ["type", _x];
        _trigger setTriggerArea [8, 8, 0, false];
        _trigger setTriggerActivation ["ANY", "PRESENT", true];
        _trigger setTriggerStatements [
            "[thisTrigger] call d_fnc_vehicle_service_valid",
            "0 = [thisTrigger getVariable ""object""] spawn d_fnc_vehicle_service_restore",
            ""
        ];
        
        _object setVariable [QGVAR(time), 0, true];
    };
    
    if (hasInterface) then {
        _marker = createMarkerLocal [format ["d_service_%1", _x select 0], position _object];
        _marker setMarkerTextLocal _name;
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "DOT";
        
        if (!isNil QMODULE(3d)) then {
            [
                _object,
                format ["%1<br /><t size='0.6'>Full repair, refuel, &amp; rearm</t>", _name call FUNC(common,YellowText)],
                [],
                true,
                true
            ] spawn FUNC(3d,create);
        };
    };
} forEach GVAR(vehicle_service_type_names);