/**
 * Vehicle Lift Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_lift_types) find (typeOf _vehicle) == -1) exitWith {};

_vehicle addEventHandler ["getin", {
    if ((_this select 1) != "driver" || {(_this select 2) != player}) exitWith {};
    
    [_this select 0, ["LandVehicle"], true] execVM __function(valid);
}];

_vehicle addEventHandler ["getout", {
    67321 cutRsc ["Default", "PLAIN"];
}];