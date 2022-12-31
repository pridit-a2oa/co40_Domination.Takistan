/**
 * Conversation Module
 *
 * Description: This module facilitates a communication layer between the
 * player and either themselves, other players, or an entity (Crossroad)
 * representing the base.
 */

#define THIS_MODULE conversation
#include "x_macros.sqf"

// Set cooldown between broadcasts over radio.
GVAR(conversation_time_cooldown) = 60;

if (hasInterface) then {
    player setVariable [QGVAR(conversation_cooldown), 0];
};

__cppfln(FUNC(THIS_MODULE,radio),THIS_MODULE\functions\fn_radio.sqf);
__cppfln(FUNC(THIS_MODULE,request),THIS_MODULE\functions\fn_request.sqf);
__cppfln(FUNC(THIS_MODULE,type),THIS_MODULE\functions\fn_type.sqf);

MODULE(THIS_MODULE) = true;