#include "x_macros.sqf"
private ["_groups_all", "_groups", "_name"];

_groups_all = [];

{
    _groups_all = _groups_all + [str _x];
} forEach allGroups;

_groups = [];

{
    if (_x in _groups_all) then {
        _name = _x;
        
        {    
            if (_name == str _x) exitWith {
                _groups = _groups + [_x];
            };
        } forEach allGroups;
    } else {
        _group = createGroup west;
        
        [nil, nil, rSpawn, [_group, GVAR(group_names) select _forEachIndex], {(_this select 0) setGroupId [(_this select 1)]}] call RE;
        
        _groups set [_forEachIndex, _group];
    };
} forEach (_this select 0);

_groups