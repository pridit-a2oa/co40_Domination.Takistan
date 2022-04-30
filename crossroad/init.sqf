/**
 * Crossroad Module
 *
 * Description: This module provides a communication layer between the player
 * and an entity representating the base.
 */

#define THIS_MODULE crossroad
#include "x_macros.sqf"

// Set cooldown between messages when performing actions that are broadcasted
GVAR(crossroad_time_cooldown) = 60;

if (hasInterface) then {
    player setVariable [QGVAR(cooldown), 0];
};

__cppfln(FUNC(THIS_MODULE,kbAddTopic),THIS_MODULE\functions\fn_kbAddTopic.sqf);
__cppfln(FUNC(THIS_MODULE,request),THIS_MODULE\functions\fn_request.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;