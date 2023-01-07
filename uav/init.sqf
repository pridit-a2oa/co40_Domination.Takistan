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

// The typical speed restriction of the aircraft
GVAR(uav_amount_speed) = 180;

// Minimum distance from base the target has to be
GVAR(uav_distance_base) = 1000;

// Maximum distance the player can call within
GVAR(uav_distance_player) = 800;

// The distance between each waypoint while patrolling
GVAR(uav_distance_waypoint) = 1500;

// Maximum distance from target to scan for enemies within
GVAR(uav_distance_scan) = 300;

// Initial spawn distance after calling
GVAR(uav_distance_spawn) = 3000;

// Amount of time (seconds) of observation
GVAR(uav_time_airborne) = 200;

// Amount of time (seconds) between pinging the area for units
GVAR(uav_time_ping) = 15;

// Amount of time (seconds) between requests
GVAR(uav_time_cooldown) = 600;

if (hasInterface) then {
    player setVariable [QGVAR(uav), false];
    
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