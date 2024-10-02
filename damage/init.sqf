/**
 * Damage Module
 *
 * Description: This module facilitates granular control of damage handling,
 * including modifiers. Without, default engine handling applies.
 */

#define THIS_MODULE damage
#include "x_macros.sqf"

// Incompatible with SP environment
if !(isMultiplayer) exitWith {};

if (hasInterface) then {
    player setVariable [QGVAR(damage_man), 0.8];
    player setVariable [QGVAR(damage_vehicle), 1, true];
};

__cppfln(FUNC(THIS_MODULE,modifier),THIS_MODULE\functions\fn_modifier.sqf);

MODULE(THIS_MODULE) = true;