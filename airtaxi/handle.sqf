/**
 * Air Taxi Module (Handler)
 */

#define THIS_MODULE airtaxi
#include "x_macros.sqf"

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["CHARLIE", "PRESENT", true];
    _trigger setTriggerStatements [
        "this",
        "0 = [] execVM 'airtaxi\functions\fn_call.sqf'",
        ""
    ];
};