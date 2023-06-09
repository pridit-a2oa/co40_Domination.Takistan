#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if !([player, _target] call BIS_fnc_areEqual) exitWith {false};
if !(triggerActivated GVAR(base_uav_trigger)) exitWith {false};
if !([player] call FUNC(common,ready)) exitWith {false};
if !([speed player, 0] call BIS_fnc_areEqual) exitWith {false};
if !(alive (X_JIPH getVariable QGVAR(base_uav))) exitWith {false};
if ([typeOf (unitBackpack player), "US_UAV_Pack_EP1"] call BIS_fnc_areEqual) exitWith {false};

true