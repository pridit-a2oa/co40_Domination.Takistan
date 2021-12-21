/**
 * Profile Module
 *
 * Description: Support for persistence of data by saving & loading
 * against a profileNamespace.
 */

#define THIS_MODULE profile
#include "x_macros.sqf"

if (hasInterface) then {
    GVAR(profile_type_save) = [];
};

__cppfln(FUNC(THIS_MODULE,load),THIS_MODULE\functions\fn_load.sqf);
__cppfln(FUNC(THIS_MODULE,sanitized),THIS_MODULE\functions\fn_sanitized.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;