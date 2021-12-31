/**
 * Board Module (Handler)
 */

#define THIS_MODULE board
#include "x_macros.sqf"

if (hasInterface) then {    
    if (!isNil QMODULE(mission_main)) then {
        help addAction ["(Feature) Main Targets" call FUNC(common,BlueText), __submoduleRE(mission_main)];
    };
    
    if (!isNil QMODULE(perk)) then {
        help addAction ["(Feature) Perks" call FUNC(common,BlueText), __submoduleRE(perk)];
    };

    if (!isNil QMODULE(base_rd)) then {
        help addAction ["(Feature) R&amp;D" call FUNC(common,BlueText), __submoduleRE(base_rd)];
    };
    
    {
        help addAction [format ["(Misc) %1", _x] call FUNC(common,BlueText), format ["board\help\%1.sqf", toLower(_x)]];
    } forEach ["Roles", "Tips"];
};