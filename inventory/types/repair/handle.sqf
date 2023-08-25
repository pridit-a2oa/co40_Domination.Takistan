/**
 * Inventory - Repair Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(inventory_repair), 0, true];
    player setVariable [QGVAR(inventory_repair_max), 0, true];

    [true, "addAction", [
        player,
        GVAR(inventory_type_actions) select (([GVAR(inventory_type_actions), "repair"] call BIS_fnc_findNestedElement) select 0)
    ]] call FUNC(network,mp);
};