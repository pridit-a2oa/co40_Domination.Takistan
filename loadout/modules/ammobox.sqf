/**
 * Loadout Module - Ammobox Submodule
 */

#define THIS_MODULE loadout
#include "x_macros.sqf"
PARAMS_1(_box);

_box addAction ["Save loadout" call FUNC(common,OliveText), __function(save), [], 2, false, true, "", "primaryWeapon player != '' && {player getVariable 'd_perkSaveLoadout'}"];
_box addAction ["Clear loadout" call FUNC(common,OliveText), __function(clear), [], 2, false, true, "", "player getVariable 'd_perkSaveLoadout' && {!isNil 'd_loadout' && {count d_loadout > 0}}"];