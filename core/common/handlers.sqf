/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"
private ["_handlers"];

_handlers = [
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
    "crossroad",
    "marker",
    "medical",
    "option",
    "perk",
    "squad",
    "vehicle_bonus",
    "vehicle_service",
    "weather"
];

{
    if (!isNil (format [QMODULE(%1), _x])) then {
        __handler(_x)
    };
} forEach _handlers;