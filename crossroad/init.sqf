/**
 * Crossroad Module
 *
 * Description: This module provides a communication layer between the player
 * and an entity representating the base.
 */

#define THIS_MODULE crossroad
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,kbAddTopic),THIS_MODULE\functions\fn_kbAddTopic.sqf);
__cppfln(FUNC(THIS_MODULE,request),THIS_MODULE\functions\fn_request.sqf);

MODULE(THIS_MODULE) = true;