#include "x_macros.sqf"
private ["_name", "_action"];

if (count GVAR(backpack) == 0) exitWith {};

_name = getText (configFile >> "CfgWeapons" >> GVAR(backpack) select 0 >> "displayName");
_action = player addAction [(format ["Equip %1", _name]) call FUNC(common,GreyText), FUNCTION(backpack,equip), [], -7, false, true, "", "player == _target && {player == vehicle player} && {(position player) select 2 < 1} && {player getVariable 'd_backpack'} && {count d_backpack > 0} && {(d_backpack_animations find (animationState player)) == -1}"];

player setVariable [QGVAR(backpack_action), _action];