#include "x_macros.sqf"
private ["_task"];

PARAMS_1(_task);

{
    private ["_name"];

    _name = [str _x, 5, [_task] call KRON_StrLen] call KRON_StrMid;
    
    if ([_name, _task] call BIS_fnc_areEqual) exitWith {
        _x
    };
} forEach (simpleTasks player);