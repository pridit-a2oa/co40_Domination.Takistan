#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_exclusions", "_tasks", "_npc", "_index", "_accolades", "_complete", "_proficiencies", "_proficiency"];

PARAMS_1(_type);

_exclusions = [_this, 1, false] call FUNC(common,param);

_tasks = player getVariable QGVAR(tasks);
_npc = call compile format ["d_%1_%2_tasks", QUOTE(THIS_MODULE), _type];
_index = ([0, GVAR(accolade_types)] call FUNC(common,arrayValues)) find _type;

_complete = {[_x select 0, 2] call BIS_fnc_areEqual} count (_tasks select _index);

_proficiencies = [0, GVAR(accolade_types_proficiency)] call FUNC(common,arrayValues);

_proficiency = _proficiencies find (_proficiencies select _complete);
_proficiency = _proficiency min (
    if !(_exclusions) then {{!([_x select 1, -1] call BIS_fnc_areEqual)} count _npc} else {_proficiency}
);

[
    _proficiencies select _proficiency,
    _proficiency,
    _complete / count _npc
]