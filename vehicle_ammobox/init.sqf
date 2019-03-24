/**
 * Vehicle Ammobox Module
 */

#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"

// Set vehicle(s) as ammobox loaders
GVAR(vehicle_ammobox_types) = [
    "M1133_MEV_EP1",
    "UH1H_TK_GUE_EP1",
    "UH60M_EP1"
];

__cppfln(FUNC(THIS_MODULE,load),THIS_MODULE\functions\fn_load.sqf);
__cppfln(FUNC(THIS_MODULE,unload),THIS_MODULE\functions\fn_unload.sqf);

MODULE(THIS_MODULE) = true;