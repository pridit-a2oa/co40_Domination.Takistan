/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"
private ["_modules"];

_modules = [
    "airdrop",
    "airtaxi",
    "ammobox",
    "artillery",
    "backpack",
    "base",
    "base_ammobox",
    "base_backpack",
    "base_halo",
    "base_service",
    "base_shield",
    "base_teleport",
    "base_wreck",
    "board",
    "communication",
    "construction",
    "crossroad",
    "farp",
    "friend",
    "halo",
    "ied",
    "inventory",
    "loadout",
    "marker",
    "mash",
    "medical",
    "nest",
    "option",
    "perk",
    "revive",
    "squad",
    "teleport",
    "trench",
    "uav",
    "vehicle",
    "vehicle_ammobox",
    "vehicle_bonus",
    "vehicle_create",
    "vehicle_flip",
    "vehicle_lift",
    "vehicle_load",
    "vehicle_menu",
    "vehicle_mhq",
    "vehicle_protection",
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
} forEach _modules;