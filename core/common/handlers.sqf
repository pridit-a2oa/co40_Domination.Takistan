/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"
private ["_handlers"];

_handlers = [
    "weather",
    "crossroad",
    "admin",
    "airdrop",
    "airtaxi",
    "artillery",
    "backpack",
    "base",
    "base_ammobox",
    "base_backpack",
    "base_bonus",
    "base_halo",
    "base_shield",
    "base_teleport",
    "base_wreck",
    "board",
    "cleanup",
    "communication",
    "construction",
    "ied",
    "intel",
    "inventory",
    "marker",
    "medical",
    "mission_main",
    "name",
    "option",
    "perk",
    "revive",
    "setting",
    "squad",
    "task",
    "uav",
    "vehicle_ammobox",
    "vehicle_load",
    "vehicle_marker",
    "vehicle_repair",
    "vehicle_service",
    "vehicle_tow"
];

{
    if (!isNil (format [QMODULE(%1), _x])) then {
        _handle = __handler(_x);
        
        waitUntil {scriptDone _handle};
    };
} forEach _handlers;