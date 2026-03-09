/**
 * Admin Module - Diary Submodule
 */

#include "x_macros.sqf"

["Admin", [
    "<img image='ca\missions_e\campaign\missions\CE8_scenePressConf.Zargabad\overview_ce8_ca' width='175'/>",
    "<br />If there is a mission breaking issue, severe bug, cheater, or active griefer you can report this to an admin.",
    "<br />Type <marker name=''>@admin</marker> as part of your message in <marker name=''>Global or Side channel only</marker>, which will cause an out of game ping.",
    "<br />You must <marker name=''>include the reasoning/context</marker> for the ping, and not just the ping word, otherwise it will be ignored.",
    "<br />Please <marker name=''>do not ping</marker> for any of the following reasons:",
    "<br />- Someone is being mean/rude (with exception of extreme toxicity/racism) to you or others over voice or text.",
    "- Discovery of a bug that is not impeding mission progress/gameplay loop.",
    "- You have a question or are unsure how something works.",
    "- There isn't a response after already pinging.",
    "<br />This facility exists to try and ensure the wellbeing and integrity of the experience for everyone.",
    "<br />Abuse of pinging/disregarding the above criteria will <marker name=''>lead to a ban</marker>."
]] call FUNC(diary,create);