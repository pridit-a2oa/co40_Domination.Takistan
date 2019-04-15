/**
 * Airtaxi Module
 */

#define THIS_MODULE airtaxi
#include "x_macros.sqf"

// Set air taxi smoke grenade
GVAR(air_taxi_smoke) = "SmokeShellBlue";

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["CHARLIE", "PRESENT", true];
    _trigger setTriggerStatements ["this", "0 = [] execVM 'airtaxi\functions\fn_call.sqf'",""];
    
    3 setRadioMsg "NULL";
};

MODULE(THIS_MODULE) = true;