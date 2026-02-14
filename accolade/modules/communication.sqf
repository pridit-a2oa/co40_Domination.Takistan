/**
 * Accolade Module - Communication Submodule
 */

#include "x_macros.sqf"

if ([GVAR(accolade_types), []] call BIS_fnc_areEqual) exitWith {};

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Accolades", [(count BIS_MENU_GroupCommunication) + 1], "", -5, [["expression", "['overview', []] execVM 'accolade\functions\fn_show.sqf'"]], "1", "1"]
];

true