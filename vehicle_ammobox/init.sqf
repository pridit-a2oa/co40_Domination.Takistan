/**
 * Vehicle Ammobox Module
 *
 * Description: Enable a vehicle to replenish, load & unload an ammobox.
 */

#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"

// Vehicle(s) as ammobox loaders
GVAR(vehicle_ammobox_types) = [
    "BMP2_HQ_TK_EP1",
    "M1130_CV_EP1",
    "UH1H_TK_EP1",
    "UH60M_EP1"
];

// GVAR(vehicle_ammobox_types) = [
//     ["BMP2_HQ_TK_EP1",  "USBasicWeaponsBox"],
//     ["M1133_MEV_EP1",   "USVehicleBox_EP1"],
//     ["UH1H_TK_EP1",     "USBasicWeaponsBox"],
//     ["UH60M_EP1",       "USBasicWeaponsBox"]
// ];

__cppfln(FUNC(THIS_MODULE,load),THIS_MODULE\functions\fn_load.sqf);
__cppfln(FUNC(THIS_MODULE,unload),THIS_MODULE\functions\fn_unload.sqf);

MODULE(THIS_MODULE) = true;