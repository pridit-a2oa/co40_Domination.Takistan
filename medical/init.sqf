/**
 * Medical Module
 *
 * Description: This module enables players to heal themselves.
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

if (hasInterface) then {
    GVAR(healing) = false;
};

__cppfln(FUNC(THIS_MODULE,heal),THIS_MODULE\functions\fn_heal.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;