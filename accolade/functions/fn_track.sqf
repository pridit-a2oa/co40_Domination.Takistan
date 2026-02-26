#include "x_macros.sqf"
private ["_array", "_identifier"];

PARAMS_1(_array);

if ([_array, []] call BIS_fnc_areEqual) exitWith {[]};

_identifier = [_this, 1, [getPlayerUID player, name player]] call FUNC(common,param);

[
    _array select 0,
    [(_array select 1) select 0, _identifier] call compile ((_array select 1) select 1)
]