/**
 * Vehicle Tow Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if ((typeOf _vehicle) == GVAR(vehicle_tow_type)) then {
    _vehicle setVariable [QGVAR(is_towing), false, true];
};

{
    if ((typeOf _vehicle) isKindOf _x) exitWith {
        _vehicle setVariable [QGVAR(is_towed), false, true];
    };
} forEach GVAR(vehicle_tow_type_towable);