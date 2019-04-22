/**
 * Airdrop Module (Handler)
 */

#define THIS_MODULE airdrop
#include "x_macros.sqf"

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["ALPHA", "PRESENT", true];
    _trigger setTriggerStatements [
        "this",
        "0 = [player getVariable 'd_airdrop_type'] execVM 'airdrop\functions\fn_call.sqf'",
        ""
    ];
};