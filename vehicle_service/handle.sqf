/**
 * Vehicle Service Module (Handler)
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_name", "_trigger"];

if (hasInterface) then {
    {
        _name = format ["d_service_%1", _x select 0];
        _formatted = format ["%1 Service", _x select 1];
        
        _trigger = createTrigger ["EmptyDetector", markerPos _name];
        _trigger setVariable ["type", _x];
        _trigger setTriggerArea [8, 8, 0, false];
        _trigger setTriggerActivation ["ANY", "PRESENT", true];
        _trigger setTriggerStatements [
            "((vehicle player) in thisList) && {((vehicle player) isKindOf ((thisTrigger getVariable ""type"") select 2))} && {(count ([(vehicle player)] unitsBelowHeight 1) > 0)} && {(speed (vehicle player) < 15)} && {fuel (vehicle player) < 0.99} && {!((vehicle player) getVariable 'd_servicing')}",
            "0 = [(vehicle player)] spawn d_fnc_vehicle_service_restore",
            ""
        ];
        
        _marker = createMarkerLocal [format ["%1_1", _name], markerPos _name];
        _marker setMarkerTextLocal _formatted;
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "DOT";
        
        if (!isNil QMODULE(3d)) then {
            [markerPos _name, _formatted] __submoduleVM(3d);
        };
    } forEach GVAR(vehicle_service_type_names);
};