/**
 * Ammobox Module
 *
 * Description: This module provides ammobox replenishing & spawning.
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"

// Ammobox types according to faction & dictate full ordnance
GVAR(ammobox_types) = [
    [
        ["BIS_TK", "BIS_TK_INS"],
        "TKBasicWeapons_EP1",
        false
    ],

    [
        [],
        "USVehicleBox_EP1",
        true
    ]
];

// List of assault rifles
GVAR(ammobox_type_rifles_assault) = [
    "AK_107_CP",
    "AK_107_GL_CP",
    "AK_107_GL_kobra",
    "AK_107_GL_pso",
    "AK_107_kobra",
    "AK_107_pso",
    "AK_47_M",
    "AK_47_S",
    "AK_74_GL_kobra",
    "AK_74_GL",
    "AK_74",
    "AKS_74_GOSHAWK",
    "AKS_74_kobra",
    "AKS_74_NSPU",
    "AKS_74_pso",
    "AKS_74_U",
    "AKS_74",
    "Bizon_Silenced",
    "bizon",
    "FN_FAL_ANPVS4",
    "FN_FAL",
    "G36_C_SD_camo",
    "G36_C_SD_Eotech",
    "G36A_camo",
    "G36A",
    "G36C_camo",
    "G36C",
    "G36K_camo",
    "G36K",
    "LeeEnfield",
    "M14_EP1",
    "M16A2",
    "M16A2GL",
    "M16A4_ACG_GL",
    "m16a4_acg",
    "M16A4_GL",
    "m16a4",
    "M4A1_AIM",
    "M4A1",
    "M4A3_CCO_EP1",
    "M4A3_RCO_GL_EP1",
    "MP5A5",
    "MP5SD",
    "Sa58P_EP1",
    "Sa58V_CCO_EP1",
    "Sa58V_EP1",
    "Sa58V_RCO_EP1",
    "SCAR_H_CQC_CCO_SD",
    "SCAR_H_CQC_CCO",
    "SCAR_H_LNG_Sniper_SD",
    "SCAR_H_LNG_Sniper",
    "SCAR_H_STD_EGLM_Spect",
    "SCAR_H_STD_TWS_SD",
    "SCAR_L_CQC_CCO_SD",
    "SCAR_L_CQC_EGLM_Holo",
    "SCAR_L_CQC_Holo",
    "SCAR_L_CQC",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_L_STD_EGLM_TWS",
    "SCAR_L_STD_HOLO",
    "SCAR_L_STD_Mk4CQT"
];

// List of sniper rifles
GVAR(ammobox_type_rifles_sniper) = [
    "DMR",
    "KSVK",
    "m107_TWS_EP1",
    "m107",
    "M110_NVG_EP1",
    "M110_TWS_EP1",
    "M24_des_EP1",
    "SVD_des_EP1",
    "SVD_NSPU_EP1",
    "SVD",
    "VSS_Vintorez"
];

// List of machine guns
GVAR(ammobox_type_machine_guns) = [
    "m240_scoped_EP1",
    "M249_EP1",
    "M249_m145_EP1",
    "M249_TWS_EP1",
    "M249",
    "M60A4_EP1",
    "MG36_camo",
    "MG36",
    "Mk_48_DES_EP1",
    "PK",
    "RPK_74"
];

// List of handguns
GVAR(ammobox_type_handguns) = [
    "Colt1911",
    "glock17_EP1",
    "M9",
    "M9SD",
    "Makarov",
    "MakarovSD",
    "revolver_EP1",
    "Sa61_EP1",
    "UZI_EP1",
    "UZI_SD_EP1"
];

// List of launchers
GVAR(ammobox_type_launchers) = [
    "Javelin",
    "M136",
    "M47Launcher_EP1",
    "MAAWS",
    "SMAW",
    "Stinger"
];

// List of grenade launchers
GVAR(ammobox_type_launchers_grenade) = [
    "M32_EP1",
    "Mk13_EP1"
];

// List of British Armed Forces (BAF) weapons
GVAR(ammobox_type_baf) = [
    "BAF_AS50_scoped",
    "BAF_AS50_TWS",
    "BAF_L110A1_Aim",
    "BAF_L7A2_GPMG",
    "BAF_L85A2_RIS_ACOG",
    "BAF_L85A2_RIS_CWS",
    "BAF_L85A2_RIS_Holo",
    "BAF_L85A2_RIS_SUSAT",
    "BAF_L85A2_UGL_ACOG",
    "BAF_L85A2_UGL_Holo",
    "BAF_L85A2_UGL_SUSAT",
    "BAF_L86A2_ACOG",
    "BAF_LRR_scoped_W",
    "BAF_LRR_scoped",
    "BAF_NLAW_Launcher"
];

// List of Private Military Company (PMC) weapons
GVAR(ammobox_type_pmc) = [
    "AA12_PMC",
    "m8_Carbine",
    "m8_CarbineGL",
    "m8_Compact",
    "m8_SAW",
    "m8_Sharpshooter"
];

// List of gun ammunition
GVAR(ammobox_type_ammo_gun) = [
    "100Rnd_556x45_BetaCMag",
    "100Rnd_556x45_M249",
    "100Rnd_762x51_M240",
    "100Rnd_762x54_PK",
    "10Rnd_127x99_m107",
    "10Rnd_762x54_SVD",
    "10Rnd_9x39_SP5_VSS",
    "10x_303",
    "15Rnd_9x19_M9",
    "15Rnd_9x19_M9SD",
    "17Rnd_9x19_glock17",
    "1Rnd_HE_GP25",
    "200Rnd_556x45_L110A1",
    "200Rnd_556x45_M249",
    "20Rnd_556x45_Stanag",
    "20Rnd_762x51_B_SCAR",
    "20Rnd_762x51_DMR",
    "20Rnd_762x51_FNFAL",
    "20Rnd_762x51_SB_SCAR",
    "20Rnd_9x39_SP5_VSS",
    "20Rnd_B_765x17_Ball",
    "20Rnd_B_AA12_74Slug",
    "20Rnd_B_AA12_HE",
    "20Rnd_B_AA12_Pellets",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AKSD",
    "30Rnd_556x45_G36",
    "30Rnd_556x45_G36SD",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_StanagSD",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_SA58",
    "30rnd_9x19_MP5",
    "30rnd_9x19_MP5SD",
    "30Rnd_9x19_UZI_SD",
    "30Rnd_9x19_UZI",
    "5Rnd_127x108_KSVK",
    "5Rnd_127x99_AS50",
    "5Rnd_762x51_M24",
    "5Rnd_86x70_L115A1",
    "64Rnd_9x19_Bizon",
    "64Rnd_9x19_SD_Bizon",
    "6Rnd_45ACP",
    "75Rnd_545x39_RPK",
    "7Rnd_45ACP_1911",
    "8Rnd_9x18_Makarov",
    "8Rnd_9x18_MakarovSD"
];

// List of launcher ammunition
GVAR(ammobox_type_ammo_launcher) = [
    "Dragon_EP1",
    "Javelin",
    "M136",
    "MAAWS_HEAT",
    "MAAWS_HEDP",
    "NLAW",
    "SMAW_HEAA",
    "SMAW_HEDP",
    "Stinger"
];

// List of grenade launcher ammunition
GVAR(ammobox_type_ammo_launcher_grenade) = [
    "1Rnd_HE_M203",
    "6Rnd_HE_M203"
];

// List of smoke grenades
GVAR(ammobox_type_ammo_smoke) = [
    "1Rnd_Smoke_GP25",
    "1Rnd_Smoke_M203",
    "1Rnd_SmokeGreen_GP25",
    "1Rnd_SmokeGreen_M203",
    "1Rnd_SmokeRed_GP25",
    "1Rnd_SmokeRed_M203",
    "1Rnd_SmokeYellow_GP25",
    "1Rnd_SmokeYellow_M203"
];

// List of flare grenades
GVAR(ammobox_type_ammo_flare) = [
    "FlareGreen_GP25",
    "FlareGreen_M203",
    "FlareRed_GP25",
    "FlareRed_M203",
    "FlareWhite_GP25",
    "FlareWhite_M203",
    "FlareYellow_GP25",
    "FlareYellow_M203"
];

// List of equipment
GVAR(ammobox_type_equipment) = [
    "Binocular_Vector",
    "Binocular",
    "Laserdesignator",
    "NVGoggles"
];

// List of miscellaneous items
GVAR(ammobox_type_misc) = [
    "HandGrenade_East",
    "HandGrenade_West",
    "HandGrenade",
    "IR_Strobe_Marker",
    "Laserbatteries",
    "Mine",
    "MineE",
    "PipeBomb",
    "SmokeShell",
    "SmokeShellBlue",
    "SmokeShellGreen",
    "SmokeShellOrange",
    "SmokeShellPurple",
    "SmokeShellYellow"
];

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;