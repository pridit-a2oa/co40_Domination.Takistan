#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_type);

_type = if ([typeName _type, "ARRAY"] call BIS_fnc_areEqual) then {_type select 1} else {_type};

{
    {
        if ([_type, _x select 0] call BIS_fnc_areEqual) exitWith {
            _type = _x;
        };
    } forEach (_x select 1);
} forEach GVAR(construction_types);

_type