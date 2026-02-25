/**
 * Item Module
 *
 * Description: This module enables players to discover and collect physical
 * items in the world.
 */

#define THIS_MODULE item
#include "x_macros.sqf"

// Valid types of items
GVAR(item_types) = [];

if (isServer) then {
    X_JIP setVariable [QGVAR(item_objects), [], true];
};

__cppfln(FUNC(THIS_MODULE,consume),THIS_MODULE\functions\fn_consume.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,model),THIS_MODULE\functions\fn_model.sqf);
__cppfln(FUNC(THIS_MODULE,offset),THIS_MODULE\functions\fn_offset.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;