/**
 * Marker Module - Vehicle Submodule
 */

#define THIS_MODULE marker
#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

{
    if (typeOf _vehicle isKindOf _x) exitWith {
        _vehicle setVariable [QGVAR(hidden), false];
        
        [_vehicle] call FUNC(THIS_MODULE,create);
        
        if (!isNil QMODULE(vehicle_mhq)) then {
            [_vehicle] __submodule(vehicle_mhq);
        };

        if (!isNil QMODULE(vehicle_service)) then {
            [_vehicle] __submodule(vehicle_service);
        };
    };
} forEach GVAR(vehicle_marker_types);