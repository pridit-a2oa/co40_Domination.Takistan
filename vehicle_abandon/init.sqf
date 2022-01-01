/**
 * Vehicle Ammobox Module
 *
 * Description: This module facilitates the determination and
 * removal of abandoned vehicles.
 */

#define THIS_MODULE vehicle_abandon
#include "x_macros.sqf"

// Set kinds of vehicles and corresponding times.
GVAR(vehicle_abandon_types) = [
    [300, "ATV_Base_EP1"],
    [300, "TT650_Base"],
    [600, "HMMWV_Base"],
    [900, "AH6_Base_EP1"],
    [3600, "AllVehicles"]
];

// Set minimum distance players have to be from the vehicle before it will delete.
GVAR(vehicle_abandon_distance_player) = 100;

__cppfln(FUNC(THIS_MODULE,time),THIS_MODULE\functions\fn_time.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;