/**
 * Vehicle Service Module (Handler)
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_object", "_name", "_trigger", "_marker"];

if (hasInterface) then {
    {
        _object = call compile format ["d_service_%1", _x select 0];
        _name = format ["%1 Service", _x select 1];
        
        _trigger = createTrigger ["EmptyDetector", position _object];
        _trigger setVariable ["type", _x];
        _trigger setTriggerArea [8, 8, 0, false];
        _trigger setTriggerActivation ["ANY", "PRESENT", true];
        _trigger setTriggerStatements [
            "((vehicle player) in thisList) && {((vehicle player) isKindOf ((thisTrigger getVariable ""type"") select 2))} && {(count ([(vehicle player)] unitsBelowHeight 1) > 0)} && {(speed (vehicle player) < 15)} && {fuel (vehicle player) < 0.99} && {!((vehicle player) getVariable 'd_servicing')}",
            "0 = [(vehicle player)] spawn d_fnc_vehicle_service_restore",
            ""
        ];
        
        _marker = createMarkerLocal [format ["d_service_%1", _x select 0], position _object];
        _marker setMarkerTextLocal _name;
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "DOT";
        
        if (!isNil QMODULE(3d)) then {
            [_object, _name] __submoduleVM(3d);
        };
    } forEach GVAR(vehicle_service_type_names);
};