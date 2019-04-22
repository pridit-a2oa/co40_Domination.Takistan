/**
 * Perk Module
 *
 * Description: Rewards system based on score accrued.
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(perk_points), 20];
    player setVariable [QGVAR(perks_unlocked), []];
};

__cppfln(FUNC(THIS_MODULE,clicked),THIS_MODULE\functions\fn_clicked.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,unlock),THIS_MODULE\functions\fn_unlock.sqf);

MODULE(THIS_MODULE) = true;