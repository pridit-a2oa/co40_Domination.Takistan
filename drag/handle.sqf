/**
 * Drag Module (Handler)
 */

#define THIS_MODULE drag
#include "x_macros.sqf"

if (hasInterface) then {
    [true, "addAction", [player, GVAR(drag_player_action)]] call FUNC(network,mp);
};