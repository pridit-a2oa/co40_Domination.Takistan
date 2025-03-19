/**
 * Vote Module
 *
 * Description: This module enables players to start and participate in votes
 * that affect the mission.
 */

#define THIS_MODULE vote
#include "x_macros.sqf"

// Incompatible with SP environment
if !(isMultiplayer) exitWith {};

// Types of votes
GVAR(vote_types) = [
    ["Skip Time", [
        ["Morning", "[true, ""skipTime"", 8] call d_fnc_network_mp"],
        ["Afternoon", "[true, ""skipTime"", 12] call d_fnc_network_mp"],
        ["Evening", "[true, ""skipTime"", 18] call d_fnc_network_mp"],
        ["Night", "[true, ""skipTime"", 22] call d_fnc_network_mp"]
    ]]
];

// Factor of players (rounded up) required above the min (min needs 100%) to pass a vote
GVAR(vote_amount_factor) = .51;

// Minimum amount of players required to start a vote
GVAR(vote_amount_players) = 3;

// Time of cooldown (applies to players)
GVAR(vote_time_cooldown) = 900;

// Time between vote creation and conclusion
GVAR(vote_time_delay) = 300;

if (hasInterface) then {
    GVAR(vote) = false;

    player setVariable [QGVAR(vote_cooldown), time + GVAR(vote_time_cooldown)];
};

if (isServer) then {
    gameLogic setVariable [QGVAR(vote), ""];
    gameLogic setVariable [QGVAR(vote_reminded), false];
    gameLogic setVariable [QGVAR(vote_time), 0];

    X_JIPH setVariable [QGVAR(vote), "", true];
    X_JIPH setVariable [QGVAR(vote_call), false, true];
    X_JIPH setVariable [QGVAR(vote_players), -1, true];
    X_JIPH setVariable [QGVAR(vote_progress), false, true];

    X_JIPH setVariable [QGVAR(votes), [], true];
};

__cppfln(FUNC(THIS_MODULE,add),THIS_MODULE\functions\fn_add.sqf);
__cppfln(FUNC(THIS_MODULE,cast),THIS_MODULE\functions\fn_cast.sqf);
__cppfln(FUNC(THIS_MODULE,complete),THIS_MODULE\functions\fn_complete.sqf);
__cppfln(FUNC(THIS_MODULE,count),THIS_MODULE\functions\fn_count.sqf);
__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,delete),THIS_MODULE\functions\fn_delete.sqf);
__cppfln(FUNC(THIS_MODULE,hint),THIS_MODULE\functions\fn_hint.sqf);
__cppfln(FUNC(THIS_MODULE,refresh),THIS_MODULE\functions\fn_refresh.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;