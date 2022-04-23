/**
 * Vehicle Ramp Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_ramp
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_ramp_types) find (typeOf _vehicle) == -1) exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(ramp), true, true];
};

if (hasInterface) then {
    _vehicle addAction [
        "Raise/Lower Ramp" call FUNC(common,YellowText),
        FUNCTION(THIS_MODULE,toggle),
        [],
        10,
        false,
        true,
        "",
        "player == driver _target"
    ];
};