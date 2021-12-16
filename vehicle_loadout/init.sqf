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
	["A10_US_EP1", [
		["Air Supremacy", [
			["GAU8", 2],
			["SidewinderLaucher_AH1Z", 3],
			[["CMFlareLauncher", "120Rnd_CMFlare_Chaff_Magazine"], 1]
		]],

		["Close Air Support", [
			["GAU8", 1],
			["MaverickLauncher", 1],
			["BombLauncherA10", 2],
			["FFARLauncher_14", 1],
			[["CMFlareLauncher", "120Rnd_CMFlare_Chaff_Magazine"], 1]
		]],

		["Standard", [
			["GAU8", 1],
			["MaverickLauncher", 1],
			["SidewinderLaucher_AH1Z", 1],
			["BombLauncherA10", 1],
			["FFARLauncher_14", 1],
			[["CMFlareLauncher", "120Rnd_CMFlare_Chaff_Magazine"], 1]
		]]
	]]
];

// Set maximum distance from base the loadout can be changed
GVAR(vehicle_loadout_distance_base) = 450;

__cppfln(FUNC(THIS_MODULE,arm),THIS_MODULE\functions\fn_arm.sqf);
__cppfln(FUNC(THIS_MODULE,clear),THIS_MODULE\functions\fn_clear.sqf);
__cppfln(FUNC(THIS_MODULE,find),THIS_MODULE\functions\fn_find.sqf);
__cppfln(FUNC(THIS_MODULE,rearm),THIS_MODULE\functions\fn_rearm.sqf);
__cppfln(FUNC(THIS_MODULE,set),THIS_MODULE\functions\fn_set.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;