/**
 * Artillery Module (Handler)
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["BRAVO", "PRESENT", true];
    _trigger setTriggerStatements ["this", "0 = [] execVM 'artillery\functions\fn_call.sqf'",""];
};