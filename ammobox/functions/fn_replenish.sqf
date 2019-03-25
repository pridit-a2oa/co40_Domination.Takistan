#include "x_macros.sqf"
private ["_box"];
PARAMS_1(_box);

[nil, nil, "per", rCLEARMAGAZINECARGO, _box] call RE;
[nil, nil, "per", rCLEARWEAPONCARGO, _box] call RE;

// Weapons: Operation Arrowhead - Rifles
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
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

// Weapons: Operation Arrowhead - Machine Guns
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
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

// Weapons: Operation Arrowhead - Sniper Rifles
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
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

// Weapons: Operation Arrowhead - Pistols
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
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

// Weapons: Operation Arrowhead - Launchers
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
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

// Weapons: Operation Arrowhead - Grenade Launchers
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
    "Mk13_EP1",
    "M32_EP1",
    "M79_EP1"
];

// Weapons: British Armed Forces
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
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

// Weapons: Private Military Company
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 10] call RE;
} forEach [
    "AA12_PMC",
    "m8_Carbine",
    "m8_CarbineGL",
    "m8_Compact",
    "m8_Sharpshooter",
    "m8_SAW"
];

// Ammo: Guns
{
    [nil, nil, "per", rADDMAGAZINECARGO, _box, _x, 100] call RE;
} forEach [
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

// Ammo: Launchers
{
    [nil, nil, "per", rADDMAGAZINECARGO, _box, _x, 50] call RE;
} forEach [
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

// Ammo: Grenade Launchers
{
    [nil, nil, "per", rADDMAGAZINECARGO, _box, _x, 50] call RE;
} forEach [
    "6Rnd_HE_M203",
    "1Rnd_HE_M203"
];

// Ammo: Smoke Grenades
{
    [nil, nil, "per", rADDMAGAZINECARGO, _box, _x, 20] call RE;
} forEach [
    "1Rnd_Smoke_GP25",
    "1Rnd_SmokeRed_GP25",
    "1Rnd_SmokeGreen_GP25",
    "1Rnd_SmokeYellow_GP25",
    "1Rnd_Smoke_M203",
    "1Rnd_SmokeRed_M203",
    "1Rnd_SmokeGreen_M203",
    "1Rnd_SmokeYellow_M203"
];

// Ammo: Flare Grenades
{
    [nil, nil, "per", rADDMAGAZINECARGO, _box, _x, 20] call RE;
} forEach [
    "FlareWhite_GP25",
    "FlareGreen_GP25",
    "FlareRed_GP25",
    "FlareYellow_GP25",
    "FlareWhite_M203",
    "FlareGreen_M203",
    "FlareRed_M203",
    "FlareYellow_M203"
];

// Equipment
{
    [nil, nil, "per", rADDWEAPONCARGO, _box, _x, 5] call RE;
} forEach [
    "Laserdesignator",
    "Binocular_Vector",
    "NVGoggles"
];

// Miscellaneous
{
    [nil, nil, "per", rADDMAGAZINECARGO, _box, _x, 20] call RE;
} forEach [
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