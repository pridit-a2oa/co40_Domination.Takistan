/**
 * Perk Module - Backpack Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

player addAction [
    (format [
        "Store %1",
        getText (configFile >> "CfgWeapons" >> (primaryWeapon player) >> "displayName")
    ]) call FUNC(common,GreyText),
    FUNCTION(backpack,store),
    [],
    -7,
    false,
    true,
    "",
    "player == _target && {(position player) select 2 < 1} && {player getVariable 'd_backpack'} && {count d_backpack == 0} && {primaryWeapon player != ''} && {primaryWeapon player == currentWeapon player} && {(d_backpack_animations find (animationState player)) == -1}"
];