/**
 * Loadout Module
 */

#define THIS_MODULE loadout
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,clear),THIS_MODULE\functions\fn_clear.sqf);
__cppfln(FUNC(THIS_MODULE,restore),THIS_MODULE\functions\fn_restore.sqf);
__cppfln(FUNC(THIS_MODULE,save),THIS_MODULE\functions\fn_save.sqf);

MODULE(THIS_MODULE) = true;