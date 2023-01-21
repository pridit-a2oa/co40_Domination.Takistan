/**
 * Vehicle Service Module (Handler)
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_object", "_name"];

{
    _object = call compile format ["d_service_%1", _x select 0];
    _name = format ["%1 Service", _x select 1];
    
    if (isServer) then {
        private ["_area", "_trigger"];

        _area = if ([_x select 0, "jet"] call BIS_fnc_areEqual) then {[10, 15, direction _object, true]} else {[6, 6, 0, false]};

        _trigger = createTrigger ["EmptyDetector", position _object];
        _trigger setVariable ["object", _object];
        _trigger setVariable ["type", _x select 2];
        _trigger setTriggerArea _area;
        _trigger setTriggerActivation ["ANY", "PRESENT", true];
        _trigger setTriggerStatements [
            "[thisTrigger, thisList] call d_fnc_vehicle_service_valid",
            "0 = [thisTrigger getVariable ""object""] spawn d_fnc_vehicle_service_restore",
            ""
        ];
        
        _object setVariable [QGVAR(time), 0, true];
    };
    
    if (hasInterface) then {
        private ["_marker"];

        _marker = createMarkerLocal [format ["d_service_%1", _x select 0], position _object];
        _marker setMarkerTextLocal _name;
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "DOT";
        
        if (!isNil QMODULE(3d)) then {
            [
                _object,
                format ["%1<br /><t color='#f0bfbfbf' size='0.6'>Full repair, refuel, &amp; rearm</t>", _name call FUNC(common,YellowText)],
                [],
                true,
                true
            ] spawn FUNC(3d,create);
        };
    };
} forEach GVAR(vehicle_service_type_names);