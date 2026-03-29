/**
 * Vehicle Pack Module
 *
 * Description: This module enables cosmetically packing certain vehicles,
 * where animations exist for this state.
 */

#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"

// Vehicles with the ability to fold rotors/wings
GVAR(vehicle_pack_types) = [
    "AH1Z",
    "MV22",
    "UH1Y"
];

__cppfln(FUNC(THIS_MODULE,toggle),THIS_MODULE\functions\fn_toggle.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;