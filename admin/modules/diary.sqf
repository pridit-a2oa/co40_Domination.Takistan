/**
 * Admin Module - Diary Submodule
 */

#include "x_macros.sqf"

["Admin", [
    "<img image='ca\missions_e\campaign\missions\CE8_scenePressConf.Zargabad\overview_ce8_ca' width='175'/>",
    "<br />If there is a mission breaking issue, severe bug, cheater, or active griefer please <marker name=''>report</marker> these to an admin.",
    "<br />You can do this by typing <marker name=''>@admin</marker> as part of your message in Global or Side channel, which will cause a Discord ping.",
    "<br />Include the reasoning/context as part of your message, and <marker name=''>not</marker> just the ping word, otherwise it will be ignored.",
    "<br />Please <marker name=''>do not</marker> ping for any of the following reasons:",
    "<br />- Someone is being mean/rude (with exception of extreme toxicity/racism) to you or others over voice or text.",
    "- Discovery of a bug but it is not significantly impacting the mission or several players.",
    "- You have a question or are unsure how something works.",
    "- There isn't a response after already pinging.",
    "<br />This facility exists to try and ensure the wellbeing and integrity of the experience for everyone.",
    "<br />Abuse of pinging/disregarding the above <marker name=''>will</marker> lead to a ban."
]] call FUNC(diary,create);