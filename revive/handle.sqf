/**
 * Revive Module (Handler)
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

if (hasInterface) then {
    [true, "addAction", [player, [
        "Debug" call FUNC(common,GreyText),
        FUNCTION(THIS_MODULE,debug),
        [],
        10,
        false,
        true,
        "",
        "_this != _target"
    ]]] call FUNC(network,mp);
    
    [true, "addAction", [player, GVAR(revive_player_action)]] call FUNC(network,mp);
};