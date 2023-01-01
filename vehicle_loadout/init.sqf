/**
 * Vehicle Loadout Module
 *
 * Description: This module provides capability of switching out
 * armaments for certain vehicles.
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"

// Set types of vehicles and possible configurations
GVAR(vehicle_loadout_types) = [
    /**
    * BLUFOR
    */
    ["A10_US_EP1", [
        ["Close Air Support", [
            ["GAU8", 1],
            ["MaverickLauncher", 1],
            ["BombLauncherA10", 1],
            ["FFARLauncher_14", 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]],

        ["Standard", [
            ["GAU8", 1],
            ["MaverickLauncher", 1],
            ["SidewinderLaucher_AH1Z", 1],
            ["BombLauncherF35", 1],
            ["FFARLauncher_14", 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]]
    ]],

    ["AH1Z", [
        ["Close Air Support", [
            ["M197", 1, [0]],
            ["MaverickLauncher", 2, [0]],
            [["FFARLauncher", "28Rnd_FFAR"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlareMagazine"], 1]
        ]],

        ["Standard", [
            ["M197", 1, [0]],
            ["MaverickLauncher", 2, [0]],
            ["SidewinderLaucher_AH1Z", 1, [0]],
            ["FFARLauncher_14", 1],
            [["CMFlareLauncher", "60Rnd_CMFlareMagazine"], 1]
        ]]
    ]],

    ["AH64D_EP1", [
        ["Standard", [
            ["M230", 1, [0]],
            ["MaverickLauncher", 2, [0]],
            [["FFARLauncher", "28Rnd_FFAR"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlareMagazine"], 1]
        ]]
    ]],

    ["AV8B2", [
        ["Air Supremacy", [
            ["GAU12", 1],
            ["SidewinderLaucher_AH1Z", 2],
            [["FFARLauncher", "28Rnd_FFAR"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]],

        ["Standard", [
            ["GAU12", 1],
            ["Mk82BombLauncher", 1],
            ["SidewinderLaucher_AH1Z", 1],
            ["FFARLauncher_14", 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]]
    ]],

    ["AW159_Lynx_BAF", [
        ["Standard", [
            ["Laserdesignator_mounted", 1, [0]],
            ["BAF_M621", 1],
            [["CRV7_PG", "12Rnd_CRV7"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlareMagazine"], 1]
        ]]
    ]],

    ["F35B", [
        ["Air Supremacy", [
            ["GAU12", 1],
            ["SidewinderLaucher_F35", 2],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]],

        ["Standard", [
            ["GAU12", 1],
            ["BombLauncherF35", 1],
            ["SidewinderLaucher_F35", 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]]
    ]],

    ["MH6J_EP1", [
        ["Standard", [
            [["CMFlareLauncher", "60Rnd_CMFlareMagazine"], 1]
        ]]
    ]],

    /**
    * OPFOR
    */
    ["L39_TK_EP1", [
        ["Standard", [
            [["GSh23L_L39", "150Rnd_23mm_GSh23L"], 1],
            [["57mmLauncher", "64Rnd_57mm"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]]
    ]],

    ["Mi24_D_TK_EP1", [
        ["Standard", [
            ["YakB", 1, [0]],
            ["AT2Launcher", 1, [0]],
            [["57mmLauncher_128", "64Rnd_57mm"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlareMagazine"], 1]
        ]]
    ]],

    ["Su25_TK_EP1", [
        ["Standard", [
            ["GSh302", 1],
            ["AirBombLauncher", 1],
            ["R73Launcher_2", 1],
            [["S8Launcher", "40Rnd_S8T"], 1],
            [["CMFlareLauncher", "60Rnd_CMFlare_Chaff_Magazine"], 1]
        ]]
    ]]
];

// Set maximum distance from base the loadout can be changed
GVAR(vehicle_loadout_distance_base) = 450;

__cppfln(FUNC(THIS_MODULE,addMagazines),THIS_MODULE\functions\fn_addMagazines.sqf);
__cppfln(FUNC(THIS_MODULE,addWeapons),THIS_MODULE\functions\fn_addWeapons.sqf);
__cppfln(FUNC(THIS_MODULE,clear),THIS_MODULE\functions\fn_clear.sqf);
__cppfln(FUNC(THIS_MODULE,find),THIS_MODULE\functions\fn_find.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;