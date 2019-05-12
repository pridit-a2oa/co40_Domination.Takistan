/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"
private ["_handlers"];

_handlers = [
    "weather",
    "airdrop",
    "airtaxi",
    "artillery",
    "backpack",
    "base",
    "base_ammobox",
    "base_backpack",
    "base_halo",
    "base_shield",
    "base_teleport",
    "base_wreck",
    "board",
    "cleanup",
    "communication",
    "construction",
    "crossroad",
    "friend",
    "ied",
    "intel",
    "marker",
    "medical",
    "mission_main",
    "name",
    "option",
    "perk",
    "revive",
    "squad",
    "task",
    "uav",
    "vehicle_bonus",
    "vehicle_load",
    "vehicle_marker",
    "vehicle_repair",
    "vehicle_service",
    "vehicle_tow"
];

{
    if (!isNil (format [QMODULE(%1), _x])) then {
        __handler(_x);
    };
} forEach _handlers;