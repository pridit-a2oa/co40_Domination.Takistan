/**
 * Artillery Module
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

// Set artillery smoke grenade
GVAR(artillery_smoke) = "SmokeShellRed";

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["BRAVO", "PRESENT", true];
    _trigger setTriggerStatements ["this", "0 = [] execVM 'artillery\functions\fn_call.sqf'",""];
    
    2 setRadioMsg "NULL";
};

MODULE(THIS_MODULE) = true;