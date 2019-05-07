/**
 * Vehicle Service Module (Handler)
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_name", "_trigger"];

if (hasInterface) then {
    {
        _name = format ["d_service_%1", _x select 0];
        
        _trigger = createTrigger ["EmptyDetector", markerPos _name];
        _trigger setVariable ["type", _x];
        _trigger setTriggerArea [8, 8, 0, true];
        _trigger setTriggerActivation ["WEST", "PRESENT", true];
        _trigger setTriggerStatements [
            "((vehicle player) in thisList) && {((vehicle player) isKindOf ((thisTrigger getVariable ""type"") select 2))} && {(count ([(vehicle player)] unitsBelowHeight 1) > 0)} && {(speed (vehicle player) < 15)}",
            "0 = [(vehicle player)] spawn d_fnc_vehicle_service_restore",
            ""
        ];
        
        _marker = createMarkerLocal [format ["%1_1", _name], markerPos _name];
        _marker setMarkerTextLocal (format ["%1 Service", _x select 1]);
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "DOT";
    } forEach GVAR(vehicle_service_type_names);
};