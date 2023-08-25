/**
 * Vote Module - Communication Submodule
 */

#define THIS_MODULE vote
#include "x_macros.sqf"

BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
    ["Voting", [(count BIS_MENU_GroupCommunication) + 1], "", -5, [["expression", "execVM 'vote\functions\fn_show.sqf'"]], "1", "Multiplayer"]
];

true