/**
 * Perk Module
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

__pSetVar [QGVAR(perk_points_available), 0];
__pSetVar [QGVAR(perks_unlocked), []];

__cppfln(SCRIPT(THIS_MODULE,dialog),THIS_MODULE\scripts\dialog.sqf);

player addAction ["My Perks" call FUNC(server,GreyText), __script(dialog), [], -2, false, true, "", ""];