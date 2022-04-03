/**
 * Vehicle Marker Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (typeOf _vehicle isKindOf "ParachuteBase") exitWith {};

{
    if ((typeOf _vehicle) isKindOf _x) exitWith {
        _marker = [_vehicle] call FUNC(THIS_MODULE,create);
        
        if (isNil "_marker") exitWith {};
        
        if (!isNil QMODULE(vehicle_deploy)) then {
            [_vehicle] __submoduleVM(vehicle_deploy);
        };

        if (!isNil QMODULE(vehicle_mhq)) then {
            [_vehicle] __submoduleVM(vehicle_mhq);
        };
        
        if (!isNil QMODULE(vehicle_wreck)) then {
            [_vehicle] __submoduleVM(vehicle_wreck);
        };
    };
} forEach GVAR(vehicle_marker_types);