/**
 * Vehicle Menu Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle addAction [
    format ["%1 Menu" call FUNC(common,YellowText),
    [typeOf (_vehicle)] call FUNC(vehicle,name)],
    __function(show),
    _vehicle,
    -3,
    false,
    true,
    "",
    "[_target] call d_fnc_vehicle_menu_valid"
];