/**
 * Vehicle Pack Module
 *
 * Description: This module enables players to pack certain types of
 * aircraft.
 */

#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"

// Vehicles with the ability to fold rotors/wings
GVAR(vehicle_pack_types) = [
    "AH1Z",
    "MV22",
    "UH1Y"
];

__cppfln(FUNC(THIS_MODULE,fold),THIS_MODULE\functions\fn_fold.sqf);

MODULE(THIS_MODULE) = true;