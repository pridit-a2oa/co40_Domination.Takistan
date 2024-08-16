/**
 * Perk Module - Backpack Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

player addAction [
    "Store Weapon" call FUNC(common,GreyText),
    FUNCTION(backpack,store),
    [],
    -7,
    false,
    true,
    "",
    "[player, _target] call BIS_fnc_areEqual && {(position player) select 2 < 1 && {player getVariable 'd_backpack' && {[count d_backpack, 0] call BIS_fnc_areEqual && {!([primaryWeapon player, ''] call BIS_fnc_areEqual) && {[primaryWeapon player, currentWeapon player] call BIS_fnc_areEqual && {[(d_backpack_animations find (animationState player)), -1] call BIS_fnc_areEqual}}}}}}"
];