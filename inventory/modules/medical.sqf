/**
 * Inventory Module - Medical Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"

[true, "addAction", [player, GVAR(medical_player_action)]] call FUNC(network,mp);