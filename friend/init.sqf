/**
 * Friend Module
 *
 * Description: This module enables players to become friends.
 */

#define THIS_MODULE friend
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(friends), []];
};

__cppfln(FUNC(THIS_MODULE,add),THIS_MODULE\functions\fn_add.sqf);

MODULE(THIS_MODULE) = true;