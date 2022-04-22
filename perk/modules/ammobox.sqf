/**
 * Perk Module - Ammobox Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_ammobox"];

PARAMS_1(_ammobox);

if (!isNil QMODULE(loadout)) then {
    _ammobox addAction ["Save loadout" call FUNC(common,YellowText), FUNCTION(loadout,save), [], 10, false, true, "", "player getVariable 'd_loadout' && {primaryWeapon player != ''}"];
    _ammobox addAction ["Clear loadout" call FUNC(common,YellowText), FUNCTION(loadout,clear), [], 10, false, true, "", "player getVariable 'd_loadout' && {count d_loadout > 0}"];
};