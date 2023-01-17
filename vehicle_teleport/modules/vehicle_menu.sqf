/**
 * Vehicle Teleport Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (!isNil QMODULE(perk) && {!(player getVariable QGVAR(teleport))}) exitWith {false};

["Fast Travel", "teleport"] call FUNC(vehicle_menu,populate);

true