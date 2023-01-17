/**
 * Inventory Medical Module
 */

#define THIS_MODULE inventory_medical
#include "x_macros.sqf"

if (hasInterface) then {
    player setVariable [QGVAR(medkits), 0, true];
    player setVariable [QGVAR(medkits_max), 0, true];
};

MODULE(THIS_MODULE) = true;