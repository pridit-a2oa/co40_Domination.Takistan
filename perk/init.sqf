/**
 * Perk Module
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,clicked),THIS_MODULE\functions\fn_clicked.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,unlock),THIS_MODULE\functions\fn_unlock.sqf);

player setVariable [QGVAR(perk_points_available), 0];
player setVariable [QGVAR(perks_unlocked), []];
player addAction ["My Perks" call FUNC(common,GreyText), __function(show), [], -2, false, true, "", ""];

MODULE(THIS_MODULE) = true;