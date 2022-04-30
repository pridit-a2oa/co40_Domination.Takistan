#include "x_macros.sqf"
private ["_vehicle", "_id"];

PARAMS_1(_vehicle);

_id = _vehicle getVariable QGVAR(id);

if (isNil "_id" || {[markerPos _id, [0,0,0]] call BIS_fnc_areEqual}) exitWith {};

_id