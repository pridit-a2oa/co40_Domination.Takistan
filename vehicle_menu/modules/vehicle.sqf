/**
 * Vehicle Menu Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_menu_types) find (typeOf _vehicle) == -1) exitWith {};

_vehicle addAction [
    format ["%1 Menu" call FUNC(common,YellowText),
    [typeOf (_vehicle)] call FUNC(vehicle,name)],
    __function(show),
    _vehicle,
    -3,
    false,
    true,
    "",
    "alive _target && {!(player in _target)} && {(vehicle player) == player} && {simulationEnabled _target} && {_target getVariable 'd_menu'} && {{alive _x && {side _x == east}} count crew _target < 1}"
];