/**
 * Perks Module
 */

#define THIS_MODULE perks
#include "x_macros.sqf"

__pSetVar [QGVAR(perk_points_available), 0];
__pSetVar [QGVAR(perks_unlocked), []];

player addAction ["My Perks" call FUNC(core,GreyText), __script(show), [], -2, false, true, "", ""];

{
    _x addAction ["My Perks" call FUNC(core,GreyText), __script(show), [], -2, false, true, "", "player in _target"];
} forEach vehicles;