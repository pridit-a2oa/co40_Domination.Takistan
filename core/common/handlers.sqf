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
    "base_wreck",
    "board",
    "chat",
    "cleanup",
    "communication",
    "construction",
    "debug",
    "idle",
    "ied",
    "intel",
    "inventory",
    "marker",
    "medical",
    "mission_main",
    "name",
    "option",
    "perimiter",
    "perk",
    "revive",
    "setting",
    "squad",
    "task",
    "teleport",
    "uav",
    "vehicle_ammobox",
    "vehicle_lift",
    "vehicle_load",
    "vehicle_marker",
    "vehicle_repair",
    "vehicle_service",
    "vehicle_tow"
];

_count = count _handlers;

{
    if (!isNil (format [QMODULE(%1), _x])) then {
        _handle = __handler(_x);
        
        if (hasInterface && {isMultiplayer}) then {
            titleText [format [
                "%1/%2\n\n%3",
                _forEachIndex + 1,
                _count,
                toUpper _x
            ], "BLACK FADED", 0];
        };
        
        waitUntil {scriptDone _handle};
    };
} forEach _handlers;