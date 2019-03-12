/**
 * Perk Module
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

__pSetVar [QGVAR(perk_points_available), 0];
__pSetVar [QGVAR(perks_unlocked), []];

player addAction ["My Perks" call FUNC(common,GreyText), __script(dialog), [], -2, false, true, "", ""];

MODULE(client,THIS_MODULE) = true;