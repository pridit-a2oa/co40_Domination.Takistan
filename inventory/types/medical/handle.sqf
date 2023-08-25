/**
 * Inventory - Medical Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(inventory_medical), 0, true];
    player setVariable [QGVAR(inventory_medical_max), 0, true];

    [true, "addAction", [
        player,
        GVAR(inventory_type_actions) select (([GVAR(inventory_type_actions), "medical"] call BIS_fnc_findNestedElement) select 0)
    ]] call FUNC(network,mp);
};