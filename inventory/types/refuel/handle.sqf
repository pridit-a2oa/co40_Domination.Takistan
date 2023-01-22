/**
 * Inventory - Refuel Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(inventory_refuel), 0];
    player setVariable [QGVAR(inventory_refuel_max), 1];
};