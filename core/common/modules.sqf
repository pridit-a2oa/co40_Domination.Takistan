/**
 * Core Module - Common (client & server)
 */

#define THIS_MODULE common
#include "x_macros.sqf"

GVAR(modules) = [
    "3d",
    "admin",
    "airdrop",
    "airtaxi",
    "ammobox",
    "artillery",
    "backpack",
    "base",
    "base_ammobox",
    "base_backpack",
    "base_bonus",
    "base_halo",
    "base_shield",
    "base_wreck",
    "board",
    // "chat",
    "cleanup",
    "communication",
    "construction",
    "crossroad",
    // "debug",
    "drag",
    "farp",
    "fortification",
    "halo",
    "idle",
    "ied",
    "intel",
    "inventory",
    "loadout",
    "marker",
    "mash",
    "medical",
    "mission_main",
    "name",
    "nest",
    "option",
    "perimiter",
    "perk",
    "respawn",
    "revive",
    "setting",
    "spectate",
    "squad",
    "task",
    "teleport",
    "uav",
    "unit",
    "vehicle",
    "vehicle_ammobox",
    "vehicle_bonus",
    "vehicle_create",
    "vehicle_flip",
    "vehicle_lift",
    "vehicle_load",
    "vehicle_marker",
    "vehicle_menu",
    "vehicle_mhq",
    "vehicle_protection",
    "vehicle_repair",
    "vehicle_respawn",
    "vehicle_service",
    "vehicle_teleport",
    "vehicle_tow",
    "vehicle_welcome",
    "vehicle_wreck",
    "weather"
];

{
    __module(_x);
} forEach GVAR(modules);

__log format ["%1 modules initialized", count GVAR(modules)]];