#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_modules"];

_modules = [
    "airdrop",
    "airtaxi",
    "artillery",
    "backpack",
    "farp",
    "fortification",
    "halo",
    "ied",
    "loadout",
    "mash",
    "medical",
    "nest",
    "perk",
    "uav",
    "vehicle_bonus",
    "vehicle_flip",
    // "vehicle_load",
    "vehicle_repair",
    "vehicle_teleport"
];

{
    __module(_x);
} forEach _modules;

BIS_MENU_Construct resize 1;
BIS_MENU_Radio resize 1;

{
    [_x select 0, _x select 1] call FUNC(THIS_MODULE,unlock);
} forEach (player getVariable QGVAR(perks_unlocked));