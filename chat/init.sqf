/**
 * Chat Module
 *
 * Description: This module facilitates text chat banning on the basis of GUID
 * (database required).
 */

#define THIS_MODULE chat
#include "x_macros.sqf"

if !(isMultiplayer) exitWith {};

if (hasInterface) then {
    uiNamespace setVariable ["X_CHAT_DIALOG", displayNull];
};

MODULE(THIS_MODULE) = true;