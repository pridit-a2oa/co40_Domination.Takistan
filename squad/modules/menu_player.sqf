/**
 * Squad Module - Menu Submodule
 */

#include "x_macros.sqf"
private ["_unit", "_name"];

PARAMS_1(_unit);

if ([group player, group _unit] call BIS_fnc_areEqual) exitWith {false};

_name = toArray str (group _unit);
_name set [0, objNull];
_name set [1, objNull];

[
    format [
        "Squad: Join (%1)",
        toString (_name - [objNull])
    ],
    "squad"
] call FUNC(menu,populate);

true