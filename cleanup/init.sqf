/**
 * Cleanup Module
 *
 * Description: This module handles periodic removal of dead & wreck units.
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,bomb),THIS_MODULE\functions\fn_bomb.sqf);
__cppfln(FUNC(THIS_MODULE,crater),THIS_MODULE\functions\fn_crater.sqf);
__cppfln(FUNC(THIS_MODULE,group),THIS_MODULE\functions\fn_group.sqf);

if (isServer) then {
    GVAR(allunits_add) = [];
};

MODULE(THIS_MODULE) = true;