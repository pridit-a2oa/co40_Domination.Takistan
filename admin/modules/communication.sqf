/**
 * Admin Module - Communication Submodule
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

if (isMultiplayer && {GVAR(admin_type_players) find (getPlayerUIDOld player) == -1}) exitWith {};

BIS_MENU_Admin = [
    ["Admin", false]
];

if (!isNil QMODULE(communication)) then {
    __submodulePP(communication);
};

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Admin", [(count BIS_MENU_GroupCommunication) + 1], "#USER:BIS_MENU_Admin", -5, [["expression", ""]], "1", "1"]
];