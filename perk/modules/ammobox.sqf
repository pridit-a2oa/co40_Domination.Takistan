/**
 * Perk Module - Ammobox Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_box"];
PARAMS_1(_box);

if (!isNil QMODULE(loadout)) then {
    _box addAction ["Save loadout" call FUNC(common,OliveText), FUNCTION(loadout,save), [], 2, false, true, "", "primaryWeapon player != '' && {player getVariable 'd_perkSaveLoadout'}"];
    _box addAction ["Clear loadout" call FUNC(common,OliveText), FUNCTION(loadout,clear), [], 2, false, true, "", "player getVariable 'd_perkSaveLoadout' && {!isNil 'd_loadout' && {count d_loadout > 0}}"];
};