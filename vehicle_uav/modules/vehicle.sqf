/**
 * Vehicle UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([GVAR(vehicle_uav_type), typeOf _vehicle] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    _vehicle lock true;
};