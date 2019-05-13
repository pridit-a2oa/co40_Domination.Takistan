/**
 * Vehicle Wreck Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_wreck_types) find (typeOf _vehicle) == -1) exitWith {};

_vehicle addEventHandler ["getin", {
    [_this select 0, ["LandVehicle", "Air"], false] execVM FUNCTION(vehicle_lift,valid);
}];

_vehicle addEventHandler ["getout", {
    67321 cutRsc ["Default", "PLAIN"];
}];