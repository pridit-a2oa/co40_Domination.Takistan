/**
 * Vote Module - Diary Submodule
 */

#include "x_macros.sqf"

["Votes", [
    "<img image='ca\missions_e\campaign\missions\CE8_scenePressConf.Zargabad\overview_ce8_ca' width='200'/>",
    "<br />Voting is a way to affect aspects of the mission, such as the time of day, that ordinarily could not be forced.",
    "<br />Use the context menu and <marker name=''>scroll</marker> to Options -> Voting to create and participate in votes.",
    format ["<br />Votes always have a running time of <marker name=''>%1</marker> minutes, but will end sooner if criteria is met.", GVAR(vote_time_delay) / 60],
    format ["<br />There must be at least <marker name=''>%1</marker> players to start a vote. Should the player count fall below this the vote will be <marker name=''>cancelled</marker>.", GVAR(vote_amount_players)],
    "<br />The <marker name=''>majority</marker> of players over the minimum must agree on a vote for it to pass, and at the minimum <marker name=''>all</marker> must agree.",
    "<br />Any players that have connected while a vote is in progress will <marker name=''>not</marker> be able to participate."
]] call FUNC(diary,create);