/**
 * Vote Module - Diary Submodule
 */

#include "x_macros.sqf"

["Votes", [
    "<img image='ca\missions_e\bootcamp\TE11_Team_command.Zargabad\overview_ca' width='175'/>",
    "<br />To affect aspects of the mission impacting everyone requires a consensus, achieved through a voting process.",
    "<br />Use the context menu and select Options -> Voting to <marker name=''>create and participate</marker> in votes.",
    format ["<br />Votes have a running time of <marker name=''>%1 minutes</marker>, but will end sooner if pass/fail criteria is met.", GVAR(vote_time_delay) / 60],
    "<br />The <marker name=''>majority of players</marker> must agree on a vote for it to pass, and at 3 or below all players <marker name=''>must agree</marker>.",
    "<br />Players joining while a vote is in progress will <marker name=''>not be able to participate</marker> so will not raise the required votes."
]] call FUNC(diary,create);