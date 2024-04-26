/**
 * Database Module - Setting Submodule
 */

#define THIS_MODULE database
#include "x_macros.sqf"

if ([[name player] call FUNC(THIS_MODULE,sanitize), ""] call BIS_fnc_areEqual) exitWith {};

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Leaderboard",
        "leaderboard",
        "Set whether character can be linked to an account via UID on the web-based leaderboard",
        ["Allow", "Disallow"],
        [10, 0]
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    0
];