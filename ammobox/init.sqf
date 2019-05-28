/**
 * Ammobox Module
 *
 * Description: This module provides ammobox replenishing & spawning.
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"

// Set ammobox module
GVAR(ammobox_type) = "USVehicleBox_EP1";

// Set list of assault rifles
GVAR(ammobox_type_rifles_assault) = [
    "AK_74_GL",
    "AK_74_GL_kobra",
    "AK_47_M",
    "AK_47_S",
    "AKS_74",
    "AKS_74_GOSHAWK",
    "AKS_74_kobra",
    "AKS_74_NSPU",
    "AKS_74_pso",
    "AKS_74_U",
    "FN_FAL",
    "FN_FAL_ANPVS4",
    "G36A_camo",
    "G36C_camo",
    "G36_C_SD_camo",
    "G36K_camo",
    "LeeEnfield",
    "M14_EP1",
    "M16A2",
    "M16A2GL",
    "M4A1",
    "M4A3_RCO_GL_EP1",
    "M4A3_CCO_EP1",
    "SCAR_L_CQC_CCO_SD",
    "SCAR_L_CQC",
    "SCAR_L_CQC_Holo",
    "SCAR_L_CQC_EGLM_Holo",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_L_STD_EGLM_TWS",
    "SCAR_L_STD_HOLO",
    "SCAR_L_STD_Mk4CQT",
    "SCAR_H_CQC_CCO",
    "SCAR_H_CQC_CCO_SD",
    "SCAR_H_STD_EGLM_Spect",
    "SCAR_H_LNG_Sniper",
    "SCAR_H_LNG_Sniper_SD",
    "SCAR_H_STD_TWS_SD",
    "Sa58P_EP1",
    "Sa58V_EP1",
    "Sa58V_RCO_EP1",
    "Sa58V_CCO_EP1"
];

// Set list of sniper rifles
GVAR(ammobox_type_rifles_sniper) = [
    "KSVK",
    "m107",
    "m107_TWS_EP1",
    "M110_NVG_EP1",
    "M110_TWS_EP1",
    "M24_des_EP1",
    "SVD_des_EP1",
    "SVD",
    "SVD_NSPU_EP1"
];

// Set list of machine guns
GVAR(ammobox_type_machine_guns) = [
    "MG36_camo",
    "m240_scoped_EP1",
    "M249_EP1",
    "M249_m145_EP1",
    "M249_TWS_EP1",
    "M60A4_EP1",
    "Mk_48_DES_EP1",
    "PK",
    "RPK_74"
];

// Set list of handguns
GVAR(ammobox_type_handguns) = [
    "glock17_EP1",
    "Colt1911",
    "M9",
    "M9SD",
    "Makarov",
    "MakarovSD",
    "revolver_EP1",
    "revolver_gold_EP1",
    "Sa61_EP1",
    "UZI_EP1",
    "UZI_SD_EP1"
];

// Set list of launchers
GVAR(ammobox_type_launchers) = [
    "Javelin",
    "Stinger",
    "Igla",
    "M136",
    "M47Launcher_EP1",
    "MAAWS",
    "MetisLauncher",
    "RPG7V",
    "RPG18",
    "Strela"
];

// Set list of grenade launchers
GVAR(ammobox_type_launchers_grenade) = [
    "Mk13_EP1",
    "M32_EP1",
    "M79_EP1"
];

// Set list of British Armed Forces (BAF) weapons
GVAR(ammobox_type_baf) = [
    "BAF_L85A2_RIS_Holo",
    "BAF_L85A2_UGL_Holo",
    "BAF_L85A2_RIS_SUSAT",
    "BAF_L85A2_UGL_SUSAT",
    "BAF_L85A2_RIS_ACOG",
    "BAF_L85A2_UGL_ACOG",
    "BAF_L85A2_RIS_CWS",
    "BAF_L86A2_ACOG",
    "BAF_L110A1_Aim",
    "BAF_L7A2_GPMG",
    "BAF_AS50_scoped",
    "BAF_AS50_TWS",
    "BAF_LRR_scoped",
    "BAF_LRR_scoped_W",
    "BAF_NLAW_Launcher"
];

// Set list of Private Military Company (PMC) weapons
GVAR(ammobox_type_pmc) = [
    "AA12_PMC",
    "m8_Carbine",
    "m8_CarbineGL",
    "m8_Compact",
    "m8_Sharpshooter",
    "m8_SAW"
];

// Set list of gun ammunition
GVAR(ammobox_type_ammo_gun) = [
    "200Rnd_556x45_M249",
    "200Rnd_556x45_L110A1",
    "100Rnd_556x45_M249",
    "100Rnd_556x45_BetaCMag",
    "100Rnd_762x51_M240",
    "100Rnd_762x54_PK",
    "75Rnd_545x39_RPK",
    "30Rnd_9x19_UZI",
    "30Rnd_9x19_UZI_SD",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AKSD",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_StanagSD",
    "30Rnd_556x45_G36",
    "30Rnd_556x45_G36SD",
    "20Rnd_556x45_Stanag",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_SA58",
    "30Rnd_762x39_SA58",
    "20Rnd_762x51_B_SCAR",
    "20Rnd_762x51_DMR",
    "20Rnd_762x51_FNFAL",
    "20Rnd_762x51_SB_SCAR",
    "20Rnd_B_765x17_Ball",
    "20Rnd_B_AA12_Pellets",
    "20Rnd_B_AA12_74Slug",
    "20Rnd_B_AA12_HE",
    "17Rnd_9x19_glock17",
    "15Rnd_9x19_M9",
    "15Rnd_9x19_M9SD",
    "10Rnd_127x99_m107",
    "10Rnd_762x54_SVD",
    "8Rnd_9x18_Makarov",
    "8Rnd_9x18_MakarovSD",
    "7Rnd_45ACP_1911",
    "6Rnd_45ACP",
    "5Rnd_86x70_L115A1",
    "5Rnd_127x99_AS50",
    "5Rnd_127x108_KSVK",
    "5Rnd_762x51_M24",
    "1Rnd_HE_GP25",
    "10x_303"
];

// Set list of launcher ammunition
GVAR(ammobox_type_ammo_launcher) = [
    "Javelin",
    "Stinger",
    "Igla",
    "M136",
    "Dragon_EP1",
    "MAAWS_HEAT",
    "MAAWS_HEDP",
    "AT13",
    "PG7V",
    "PG7VL",
    "PG7VR",
    "OG7",
    "RPG18",
    "Strela",
    "NLAW"
];

// Set list of grenade launcher ammunition
GVAR(ammobox_type_ammo_launcher_grenade) = [
    "6Rnd_HE_M203",
    "1Rnd_HE_M203"
];

// Set list of smoke grenades
GVAR(ammobox_type_ammo_smoke) = [
    "1Rnd_Smoke_GP25",
    "1Rnd_SmokeRed_GP25",
    "1Rnd_SmokeGreen_GP25",
    "1Rnd_SmokeYellow_GP25",
    "1Rnd_Smoke_M203",
    "1Rnd_SmokeRed_M203",
    "1Rnd_SmokeGreen_M203",
    "1Rnd_SmokeYellow_M203"
];

// Set list of flare grenades
GVAR(ammobox_type_ammo_flare) = [
    "FlareWhite_GP25",
    "FlareGreen_GP25",
    "FlareRed_GP25",
    "FlareYellow_GP25",
    "FlareWhite_M203",
    "FlareGreen_M203",
    "FlareRed_M203",
    "FlareYellow_M203"
];

// Set list of equipment
GVAR(ammobox_type_equipment) = [
    "Laserdesignator",
    "Binocular_Vector",
    "NVGoggles"
];

// Set list of miscellaneous items
GVAR(ammobox_type_misc) = [
    "HandGrenade",
    "HandGrenade_West",
    "HandGrenade_East",
    "SmokeShell",
    "SmokeShellGreen",
    "SmokeShellYellow",
    "SmokeShellOrange",
    "SmokeShellPurple",
    "SmokeShellBlue",
    "PipeBomb",
    "Mine",
    "MineE",
    "IR_Strobe_Marker",
    "Laserbatteries"
];

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;