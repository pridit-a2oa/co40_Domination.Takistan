/**
 * Vehicle Refuel Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_refuel
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_refuel_types) find (typeOf _vehicle) != -1) exitWith {false};
if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {false};

["Repair Kit: Use", "repair_kit"] call FUNC(vehicle_menu,populate);

true