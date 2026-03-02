/**
 * Artillery Module
 *
 * Description: This module enables players to call in an artillery strike.
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

// Ordnance type
GVAR(artillery_type_ordnance) = [
    ["High Explosive", "HE"]
];

// Smoke grenade type
GVAR(artillery_type_smoke) = "SmokeShellRed";

// Minimum distance from base the position has to be
GVAR(artillery_distance_base) = 500;

// Minimum distance from any friendly units
GVAR(artillery_distance_friendly) = 150;

// Maximum distance from player position
GVAR(artillery_distance_range) = 1500;

// Number of shells per salvo
GVAR(artillery_amount_shell) = 3;

// Time between requests
GVAR(artillery_time_cooldown) = 1200;

if (hasInterface) then {
    player setVariable [QGVAR(artillery), false];
    player setVariable [QGVAR(artillery_salvoes), 0];
    player setVariable [QGVAR(artillery_types), GVAR(artillery_type_ordnance)];

    if (isNil {player getVariable QGVAR(artillery_type)}) then {
        player setVariable [QGVAR(artillery_type), [0, (GVAR(artillery_type_ordnance) select 0) select 1]];
    };

    if (isNil {player getVariable QGVAR(artillery_cooldown)}) then {
        player setVariable [QGVAR(artillery_cooldown), time + GVAR(artillery_time_cooldown)];
    };
};

if (isServer) then {
    gameLogic setVariable [QGVAR(artillery_unit), []];

    X_JIP setVariable [QGVAR(artillery_call), false, true];
    X_JIP setVariable [QGVAR(artillery_progress), false, true];
};

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);
__cppfln(FUNC(THIS_MODULE,trail),THIS_MODULE\functions\fn_trail.sqf);

MODULE(THIS_MODULE) = true;