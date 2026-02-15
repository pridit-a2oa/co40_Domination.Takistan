/**
 * Vote Module - Diary Submodule
 */

#include "x_macros.sqf"

["Votes", [
    "<img image='ca\missions_e\bootcamp\TE11_Team_command.Zargabad\overview_ca' width='175'/>",
    "<br />Use the context menu and select Options -> Voting to create and participate in votes.",
    format ["<br />Votes have a total running time of <marker name=''>%1</marker> minutes, but will end sooner if pass/fail criteria is met.", GVAR(vote_time_delay) / 60],
    format ["<br />Should the player count fall below the required minimum of <marker name=''>%1</marker> the vote will automatically <marker name=''>fail</marker>.", GVAR(vote_amount_players)],
    "<br />The <marker name=''>majority</marker> of players must agree on a vote for it to pass, and at 3 or below <marker name=''>all</marker> players must agree.",
    "<br />Players that have joined while a vote is in progress will <marker name=''>not</marker> be able to participate so will not impact the required votes."
]] call FUNC(diary,create);