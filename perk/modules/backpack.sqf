/**
 * Perk Module - Backpack Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

player addAction ["Store Weapon" call FUNC(common,GreyText), FUNCTION(backpack,store), [], -7, false, true, "", "player == _target && {(position player) select 2 < 1} && {player getVariable 'd_backpack'} && {(count (player getVariable 'd_backpack_hold')) == 0} && {primaryWeapon player != ''} && {primaryWeapon player == currentWeapon player} && {(d_backpack_animations find (animationState player)) == -1}"];