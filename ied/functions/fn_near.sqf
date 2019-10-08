#include "x_macros.sqf"
private ["_unit", "_ieds", "_distances", "_ied", "_distance"];

PARAMS_1(_unit);

_ieds = [];
_distances = [];

{
    _ied = nearestObject [_unit, _x];
    
    _ieds = _ieds + [_ied];
    _distances = _distances + [_unit distance _ied];
} forEach GVAR(ied_type_objects);

if ({isNull _x} count _ieds == count GVAR(ied_type_objects)) exitWith {};

_distance = _distances call BIS_fnc_lowestNum;
_ied = _ieds select (_distances find _distance);

if (_ied getVariable QGVAR(exploded)) exitWith {};
if (_unit distance _ied > (GVAR(ied_trigger_distances) select 1)) exitWith {};

_ied