/**
 * Vehicle Marker Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (typeOf _vehicle isKindOf "ParachuteBase") exitWith {};

{
    private ["_marker"];

    if (typeOf _vehicle isKindOf _x) exitWith {
        _marker = [_vehicle] call FUNC(THIS_MODULE,create);

        if (isNil "_marker") exitWith {};

        if !(isNil QMODULE(vehicle_deploy)) then {
            [_vehicle] __submoduleVM(vehicle_deploy);
        };

        if !(isNil QMODULE(vehicle_wreck)) then {
            [_vehicle] __submoduleVM(vehicle_wreck);
        };
    };
} forEach GVAR(vehicle_marker_types);