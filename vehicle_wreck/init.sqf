/**
 * Vehicle Wreck Module
 */

#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"

// Set vehicles capable of lifting wrecks
GVAR(vehicle_wreck_type_lifts) = [
    "UH60M_MEV_EP1"
];

// Set rebuild times
GVAR(vehicle_wreck_time_rebuild) = [
    [480, "LandVehicle"],
    [600, "Helicopter"],
    [720, "Plane"]
];

// Set chance that enemy aircraft can produce a rebuildable wreck
GVAR(vehicle_wreck_chance_enemy) = 30;

if (isServer) then {
    GVAR(rebuilding) = false;
    GVAR(wreck_hangar_triggers) = [];
    GVAR(wreck_hangars_occupied) = 0;
};

__cppfln(FUNC(THIS_MODULE,rebuild),THIS_MODULE\functions\fn_rebuild.sqf);
__cppfln(FUNC(THIS_MODULE,rebuilt),THIS_MODULE\functions\fn_rebuilt.sqf);
__cppfln(FUNC(THIS_MODULE,service),THIS_MODULE\functions\fn_service.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;