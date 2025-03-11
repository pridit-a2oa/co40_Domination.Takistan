/**
 * Base R&D Module
 *
 * Description: This module provides the facility for players to deconstruct
 * vehicles (to work towards research) and construct researched vehicles.
 */

#define THIS_MODULE base_rd
#include "x_macros.sqf"

// Composition of the R&D point
GVAR(base_rd_type_composition) = "HeliParking1_US_EP1";

// Types of vehicles that can be researched & subsequently built
GVAR(base_rd_type_vehicles) = [
    "BMP2_TK_EP1",
    "BRDM2_ATGM_TK_EP1",
    "BRDM2_TK_EP1",
    "BTR60_TK_EP1",
    "L39_TK_EP1",
    "M113_TK_EP1",
    "Mi17_TK_EP1",
    "Mi24_D_TK_EP1",
    "Su25_TK_EP1",
    "T55_TK_EP1",
    "T72_TK_EP1",
    "UH1H_TK_EP1",
    "ZSU_TK_EP1"
];

// Amount of deconstructed vehicles (based on type) before being able to construct
GVAR(base_rd_amount_required) = [
    [4, "UH1H_base"],
    [4, "Mi17_base_TK_EP1"],
    [5, "Air"],
    [5, "T55_Base"],
    [5, "T72_Base"],
    [4, "Tank"],
    [4, "Wheeled_APC"],
    [3, "Truck"]
];

// Amount of score to reward a player once a vehicle has been deconstructed
GVAR(base_rd_amount_score) = 4;

// Amount of time it takes to construct vehicles
GVAR(base_rd_time_construct) = [
    [1200, "Truck"],
    [1500, "M113_Base"],
    [1500, "Tracked_APC"],
    [2100, "BRDM2_ATGM_Base"],
    [1500, "Wheeled_APC"],
    [2700, "Mi24_Base"],
    [1800, "Helicopter"],
    [2400, "Tank"],
    [2700, "Plane"]
];

// Cooldown after building before being able to construct another vehicle
GVAR(base_rd_time_cooldown) = 180;

// The divisor against the construction time to deconstruct vehicles
GVAR(base_rd_time_divisor) = 5.4;

if (hasInterface) then {
    player setVariable [QGVAR(base_rd_cooldown), time + GVAR(base_rd_time_cooldown)];
};

if (isServer) then {
    GVAR(base_rd) setVariable [QGVAR(build), false, true];
    GVAR(base_rd) setVariable [QGVAR(processing), false, true];
    GVAR(base_rd) setVariable [QGVAR(time), 0, true];
};

__cppfln(FUNC(THIS_MODULE,construct),THIS_MODULE\functions\fn_construct.sqf);
__cppfln(FUNC(THIS_MODULE,deconstruct),THIS_MODULE\functions\fn_deconstruct.sqf);
__cppfln(FUNC(THIS_MODULE,item),THIS_MODULE\functions\fn_item.sqf);
__cppfln(FUNC(THIS_MODULE,max),THIS_MODULE\functions\fn_max.sqf);
__cppfln(FUNC(THIS_MODULE,player),THIS_MODULE\functions\fn_player.sqf);
__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;