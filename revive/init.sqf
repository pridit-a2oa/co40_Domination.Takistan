/**
 * Revive Module
 *
 * Description: This module enables players to revive eachother, should they
 * be mortally wounded.
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

// Set amount of damage a revived player will have
GVAR(revive_amount_damage) = 0.5;

if (hasInterface) then {
    player setVariable [QGVAR(revive_damage), GVAR(revive_amount_damage)];
};

__cppfln(FUNC(THIS_MODULE,revive),THIS_MODULE\functions\fn_revive.sqf);
__cppfln(FUNC(THIS_MODULE,suicide),THIS_MODULE\functions\fn_suicide.sqf);

MODULE(THIS_MODULE) = true;