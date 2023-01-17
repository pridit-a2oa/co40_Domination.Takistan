/**
 * Vehicle Repair Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_repair
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_repair_types) find (typeOf _vehicle) != -1) exitWith {false};
if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {false};

["Repair Kit: Use", "repair"] call FUNC(vehicle_menu,populate);

true