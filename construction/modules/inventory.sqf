/**
 * Construction Module - Inventory Submodule
 */

#define THIS_MODULE construction
#include "x_macros.sqf"

{
    if ([count _x, 3] call BIS_fnc_areEqual) then {
        GVAR(inventory_type_visible) = GVAR(inventory_type_visible) + [
            [format ["%1_%2", QUOTE(THIS_MODULE), toLower (_x select 0)], _x select 2]
        ];
    };
} forEach GVAR(construction_types);