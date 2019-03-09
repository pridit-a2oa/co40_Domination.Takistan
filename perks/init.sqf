/**
 * Perks Module
 */

#include "x_macros.sqf"

__pSetVar [QGVAR(perk_points_available), 0];
__pSetVar [QGVAR(perks_unlocked), []];

player addAction ["My Perks", "perks\scripts\show.sqf",[],-2,false,true,"",""];