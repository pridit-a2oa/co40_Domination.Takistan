/**
 * Perk Module
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

player setVariable [QGVAR(perk_points_available), 5];
player setVariable [QGVAR(perks_unlocked), []];

__cppfln(FUNC(THIS_MODULE,clicked),THIS_MODULE\functions\fn_clicked.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,unlock),THIS_MODULE\functions\fn_unlock.sqf);

call FUNC(THIS_MODULE,reset);

player addAction ["My Perks" call FUNC(common,GreyText), __function(show), [], -10, false, true, "", "player == _target"];

MODULE(THIS_MODULE) = true;