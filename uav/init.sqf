/**
 * UAV Module
 *
 * Description: This module enables players to call in an AI controlled UAV that
 * will circle a radius and display map markers for enemy units within it.
 */

#define THIS_MODULE uav
#include "x_macros.sqf"

// The aircraft type
GVAR(uav_type_aircraft) = "MQ9PredatorB_US_EP1";

// The elevation the aircraft will maintain
GVAR(uav_amount_height) = 800;

// Minimum distance from base the target has to be
GVAR(uav_distance_base) = 1000;

// Maximum distance the player can call within
GVAR(uav_distance_player) = 1200;

// The distance between each waypoint while patrolling
GVAR(uav_distance_waypoint) = 1500;

// Distance from target to scan for enemies within
GVAR(uav_distance_scan) = 250;

// Initial spawn distance after calling
GVAR(uav_distance_spawn) = 3000;

// Amount of time (seconds) of observation
GVAR(uav_time_airborne) = 200;

// Amount of time (seconds) between pinging the area for units
GVAR(uav_time_ping) = 15;

// Amount of time (seconds) between requests
GVAR(uav_time_cooldown) = 900;

if (hasInterface) then {
    player setVariable [QGVAR(uav), false];
    player setVariable [QGVAR(uav_radius), GVAR(uav_distance_scan)];

    if (isNil {player getVariable QGVAR(uav_cooldown)}) then {
        player setVariable [QGVAR(uav_cooldown), time + GVAR(uav_time_cooldown)];
    };
};

if (isServer) then {
    X_JIPH setVariable [QGVAR(uav_call), false, true];
    X_JIPH setVariable [QGVAR(uav_progress), false, true];
};

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);
__cppfln(FUNC(THIS_MODULE,patrol),THIS_MODULE\functions\fn_patrol.sqf);
__cppfln(FUNC(THIS_MODULE,ping),THIS_MODULE\functions\fn_ping.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;