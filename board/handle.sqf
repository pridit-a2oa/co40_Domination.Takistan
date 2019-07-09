/**
 * Board Module (Handler)
 */

#define THIS_MODULE board
#include "x_macros.sqf"

if (hasInterface) then {    
    if (!isNil QMODULE(mission_main)) then {
        help addAction ["Main Targets" call FUNC(common,BlueText), __submoduleRE(mission_main)];
    };
    
    if (!isNil QMODULE(perk)) then {
        help addAction ["Perks" call FUNC(common,BlueText), __submoduleRE(perk)];
    };
    
    {
        help addAction [_x call FUNC(common,BlueText), format ["board\help\%1.sqf", toLower(_x)]];
    } forEach ["Roles", "Tips"];
};