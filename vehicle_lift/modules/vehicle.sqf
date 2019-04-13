/**
 * Vehicle Lift Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_attachee"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_lift_types) find (typeOf _vehicle) == -1) exitWith {};

_vehicle addEventHandler ["getin", {
    _this execVM __function(valid);
}];