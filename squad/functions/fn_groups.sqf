#include "x_macros.sqf"
private ["_all", "_groups"];

_all = [];
_groups = [];

{
    [_all, str _x] call BIS_fnc_arrayPush;
} forEach allGroups;

{
    if (_x in _all) then {
        private ["_name"];

        _name = _x;
        
        {
            if ([_name, str _x] call BIS_fnc_areEqual) exitWith {
                [_groups, _x] call BIS_fnc_arrayPush;
            };
        } forEach allGroups;
    } else {
        private ["_group"];

        _group = createGroup west;
        
        [true, "setGroupId", [
            _group,
            GVAR(group_names) select _forEachIndex
        ]] call FUNC(network,mp);
        
        _groups set [_forEachIndex, _group];
    };
} forEach (_this select 0);

_groups