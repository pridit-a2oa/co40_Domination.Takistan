#include "x_macros.sqf"

if (GVAR(healing)) exitWith {false};
if !([player, _target] call BIS_fnc_areEqual) exitWith {false};
if !([vehicle player, player] call BIS_fnc_areEqual) exitWith {false};
if !((position player) select 2 < 1) exitWith {false};
if (damage player < 0.1 && {canStand player}) exitWith {false};
if (!isNil QMODULE(inventory_medical) && {player getVariable QGVAR(inventory_medical) < 1}) exitWith {false};

true