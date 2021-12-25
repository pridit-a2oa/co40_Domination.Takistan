/**
 * Base R&D Module
 *
 * Description: This module provides the facility for players to deconstruct
 * vehicles (to work towards research) and construct researched vehicles.
 */

#define THIS_MODULE base_rd
#include "x_macros.sqf"

// Set composition of the R&D point.
GVAR(base_rd_type_composition) = "HeliParking1_US_EP1";

// Set types of vehicles that can be researched & subsequently built.
GVAR(base_rd_type_vehicles) = [
    "BMP2_TK_EP1",
    "BRDM2_TK_EP1",
    "BTR60_TK_EP1",
    "L39_TK_EP1",
    "M113_TK_EP1",
    "Mi24_D_TK_EP1",
    "Su25_TK_EP1",
    "T34_TK_EP1",
    "T55_TK_EP1",
    "T72_TK_EP1",
    "UH1H_TK_EP1",
    "Ural_ZU23_TK_EP1",
    "ZSU_TK_EP1"
];

// Set amount of deconstructed vehicles (based on type) before being able to construct.
GVAR(base_rd_amount_required) = [
    [3, "Air"],
    [3, "Tank"],
    [3, "Wheeled_APC"],
    [2, "Truck"]
];

// Set amount of score to reward a player once a vehicle has been deconstructed.
GVAR(base_rd_amount_score) = 3;

// Set amount of time it takes to deconstruct.
GVAR(base_rd_time_deconstruct) = [
    [240, "Truck"],
    [300, "M113_Base"],
    [300, "Tracked_APC"],
    [300, "Wheeled_APC"],
    [360, "UH1H_base"],
    [420, "Tank"],
    [480, "Helicopter"],
    [480, "Plane"]
];

// Set the multiplier from the deconstruction time to construct.
GVAR(base_rd_time_multiplier) = 5;

if (isServer) then {
    GVAR(base_rd_progress) = [];

    GVAR(base_rd) setVariable [QGVAR(time), 0, true];
};

hint format ["%1", inheritsFrom (configFile >> "CfgVehicles" >> "M113_TK_EP1")];

__cppfln(FUNC(THIS_MODULE,item),THIS_MODULE\functions\fn_item.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);

MODULE(THIS_MODULE) = true;