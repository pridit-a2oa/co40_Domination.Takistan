/**
 * Air Taxi Module
 *
 * Description: This module enables players to call in an air taxi that will
 * take them back to base.
 */

#define THIS_MODULE airtaxi
#include "x_macros.sqf"

// Aircraft type
GVAR(air_taxi_type_aircraft) = "UH60M_EP1";

// Smoke grenade type
GVAR(air_taxi_type_smoke) = "SmokeShellBlue";

// Minimum distance from base the position has to be
GVAR(air_taxi_distance_base) = 1500;

// Minimum distance from any enemy units
GVAR(air_taxi_distance_enemy) = 300;

// Maximum distance the player can call within
GVAR(air_taxi_distance_player) = 200;

// Initial spawn distance when calling
GVAR(air_taxi_distance_spawn) = 3000;

// Minimum time between requests
GVAR(air_taxi_time_cooldown) = 900;

// Time before departing pick-up point
GVAR(air_taxi_time_wait) = 60;

if (hasInterface) then {
    player setVariable [QGVAR(air_taxi), false];
    player setVariable [QGVAR(air_taxi_cooldown), time];
};

if (isServer) then {
    X_JIPH setVariable [QGVAR(air_taxi_call), false, true];
    X_JIPH setVariable [QGVAR(air_taxi_progress), false, true];
};

__cppfln(FUNC(THIS_MODULE,call),THIS_MODULE\functions\fn_call.sqf);

MODULE(THIS_MODULE) = true;