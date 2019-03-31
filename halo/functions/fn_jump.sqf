#define THIS_MODULE halo
#include "x_macros.sqf"
private ["_altitude"];

if (count _this > 1) then {
    _altitude = ((getPos (_this select 1)) select 2) - 5;
} else {
    _altitude = _this select 0;
};

[player, _altitude] spawn BIS_fnc_halo;