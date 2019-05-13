/**
 * Revive Module
 *
 * Description: This module enables players to revive eachother, should they
 * be mortally wounded.
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

if (!isMultiplayer) exitWith {};

// Set blood effects
GVAR(revive_type_blood) = [
    QGVAR(revive_blood_1),
    QGVAR(revive_blood_2)
];

// Set amount of damage a revived player will have
GVAR(revive_amount_damage) = 0.5;

if (hasInterface) then {
    player setVariable [QGVAR(head_hit), 0];
    player setVariable [QGVAR(body), 0];
    player setVariable [QGVAR(hands), 0];
    player setVariable [QGVAR(legs), 0];
    player setVariable [QGVAR(overall), 0];
    
    player setVariable [QGVAR(unconscious), false, true];
    player setVariable [QGVAR(reviving), false, true];
    player setVariable [QGVAR(revive_damage), GVAR(revive_amount_damage)];
};

__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,revive),THIS_MODULE\functions\fn_revive.sqf);
__cppfln(FUNC(THIS_MODULE,unconscious),THIS_MODULE\functions\fn_unconscious.sqf);

MODULE(THIS_MODULE) = true;