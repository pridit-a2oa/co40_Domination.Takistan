#include "x_macros.sqf"
private ["_textures", "_options"];

PARAMS_1(_textures);

_options = [];

{
    [
        _options,
        if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {_x select 0} else {_x}
    ] call BIS_fnc_arrayPush;
} forEach _textures;

_options