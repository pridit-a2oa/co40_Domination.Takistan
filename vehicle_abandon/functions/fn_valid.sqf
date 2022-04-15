#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(alive _vehicle) exitWith {false};
if !(simulationEnabled _vehicle) exitWith {false};
if ({!isPlayer _x && {alive _x}} count crew _vehicle > 0) exitWith {false};
if ({_x distance _vehicle < GVAR(vehicle_abandon_distance_player)} count (call FUNC(common,players)) > 0) exitWith {false};
if (!isNil QMODULE(vehicle_deploy) && {!isNil {_vehicle getVariable QGVAR(deployed)}} && {(_vehicle getVariable QGVAR(deployed)) select 0}) exitWith {false};
if (_vehicle distance (markerPos QGVAR(base_south)) < GVAR(vehicle_abandon_distance_base) && {!((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"])}) exitWith {false};

true