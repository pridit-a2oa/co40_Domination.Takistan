/**
 * Vehicle Bomber Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_bomber"];

PARAMS_1(_vehicle);

_bomber = _vehicle getVariable QGVAR(bomber);

if (isNil "_bomber" || {!_bomber}) exitWith {false};
if ([GVAR(vehicle_bomber_type_vehicles) find (typeOf _vehicle), -1] call BIS_fnc_areEqual) exitWith {false};

["Talk: Intel", "bomber"] call FUNC(vehicle_menu,populate);

true