/**
 * Revive Module (Handler)
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

if (hasInterface) then {
    [true, "addAction", [player, GVAR(revive_player_action)]] call FUNC(network,mp);
};