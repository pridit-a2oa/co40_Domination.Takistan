/**
 * Perk Module
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

player setVariable [QGVAR(perk_points_available), 0];
player setVariable [QGVAR(perks_unlocked), []];
player addAction ["My Perks" call FUNC(common,GreyText), __script(dialog), [], -2, false, true, "", ""];

MODULE(THIS_MODULE) = true;