#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_modules"];

{
    __module(_x);
} forEach [
    "airdrop",
    "airtaxi",
    "artillery",
    "backpack",
    "halo",
    "ied",
    "loadout",
    "medical",
    "perk",
    "uav",
    "vehicle_bonus",
    // "vehicle_cargo",
    "vehicle_repair",
    "vehicle_teleport",
    "vehicle_unflip"
];

BIS_MENU_Construct resize 1;
BIS_MENU_Radio resize 1;

{
    [_x select 0, _x select 1] call FUNC(THIS_MODULE,unlock);
} forEach (player getVariable QGVAR(perks_unlocked));