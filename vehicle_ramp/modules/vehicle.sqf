/**
 * Vehicle Ramp Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_ramp
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_ramp_types)) exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(ramp), true, true];
};

if (hasInterface) then {
    _vehicle addAction [
        "Lower/Raise Ramp" call FUNC(common,YellowText),
        FUNCTION(THIS_MODULE,toggle),
        [],
        10,
        false,
        true,
        "",
        "[player, driver _target] call BIS_fnc_areEqual"
    ];
};