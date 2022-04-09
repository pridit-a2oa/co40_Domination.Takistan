/**
 * Loadout Module
 *
 * Description: This module enables a player to persist most of their
 * equipment between respawns.
 */

#define THIS_MODULE loadout
#include "x_macros.sqf"

if (hasInterface) then {
    if (isNil {GVAR(loadout)}) then {
        GVAR(loadout) = [];
    };
    
    player setVariable [QGVAR(loadout), false];
};

__cppfln(FUNC(THIS_MODULE,clear),THIS_MODULE\functions\fn_clear.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);
__cppfln(FUNC(THIS_MODULE,save),THIS_MODULE\functions\fn_save.sqf);

MODULE(THIS_MODULE) = true;