/**
 * Board Module (Handler)
 */

#define THIS_MODULE board
#include "x_macros.sqf"

if (hasInterface) then {
    {
        help addAction [_x call FUNC(common,BlueText), format ["board\help\%1.sqf", toLower(_x)]];
    } forEach ["Missions", "Perks", "Roles", "Tips"];
};