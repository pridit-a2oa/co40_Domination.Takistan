/**
 * Inventory Module - Vehicle Repair Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

[true, "addAction", [player, GVAR(vehicle_repair_player_action)]] call FUNC(network,mp);