#define THIS_MODULE halo
#include "x_macros.sqf"
private ["_unit"];

_unit = [_this, 1, player] call FUNC(common,param);

if !([_unit, vehicle _unit] call BIS_fnc_areEqual) then {
    moveOut _unit;
};

[
    _unit,
    switch (count _this > 1) do {
        case true: {((getPos (_this select 1)) select 2) - 5};
        case false: {_this select 0};
    }
] spawn BIS_fnc_halo;