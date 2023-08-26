#include "x_macros.sqf"
private ["_name", "_toggle"];

PARAMS_2(_name, _toggle);

{
    if ([_x select 0, _name] call BIS_fnc_areEqual) exitWith {
        private ["_array"];
        
        _array = BIS_MENU_GroupCommunication select _forEachIndex;
        _array set [6, format ["%1", _toggle]];
        
        BIS_MENU_GroupCommunication set [_forEachIndex, _array];
    };
} forEach BIS_MENU_GroupCommunication;