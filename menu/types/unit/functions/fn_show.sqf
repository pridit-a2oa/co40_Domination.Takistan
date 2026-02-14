#define THIS_MODULE menu_unit
#include "x_macros.sqf"
private ["_valid"];

_valid = [];

if !(isNil QMODULE(accolade)) then {
    [_valid, [GVAR(menu_entity)] __submodulePP(accolade)] call BIS_fnc_arrayPush;
};