/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["JULIET", "PRESENT", true];
    _trigger setTriggerStatements [
        "this",
        "0 = [] execVM 'squad\functions\fn_leave.sqf'",
        ""
    ];
    
    [nil, player, "per", rAddAction, "Join Squad", __function(join), [], 3, false, true, "", "player != _target && {group player != (group _target)}"] call RE;
};