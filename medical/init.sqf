/**
 * Medical Module
 *
 * Description: This module enables players to heal themselves.
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

// Set damage threshold
GVAR(medical_threshold_damage) = 0.3;

if (hasInterface) then {
    player setVariable [QGVAR(medkits), 0, true];
    player setVariable [QGVAR(medkits_max), 0, true];
};

__cppfln(FUNC(THIS_MODULE,heal),THIS_MODULE\functions\fn_heal.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;