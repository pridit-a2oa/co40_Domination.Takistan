/**
 * Airdrop Module
 */

#define THIS_MODULE airdrop
#include "x_macros.sqf"

// Set the airdrop aircraft
GVAR(airdrop_aircraft) = "C130J_US_EP1";

// Set airdrop aircraft spawn radius
GVAR(airdrop_aircraft_radius) = 1000; // 4500

// Set airdrop smoke grenade
GVAR(airdrop_smoke) = "SmokeShellGreen";

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);
__cppfln(FUNC(THIS_MODULE,drop),THIS_MODULE\functions\fn_drop.sqf);

if (hasInterface) then {
    _trigger = createTrigger ["EmptyDetector", position player];
    _trigger setTriggerActivation ["ALPHA", "PRESENT", true];
    _trigger setTriggerStatements ["this", "0 = ['USVehicleBox_EP1'] execVM 'airdrop\functions\fn_call.sqf'",""];
    
    // 1 setRadioMsg "NULL";
};

MODULE(THIS_MODULE) = true;