/**
 * Mission Mini Module - Diary Submodule
 */

#include "x_macros.sqf"

["Mini Missions", [
    "<img image='ca\missions_e\campaign\missions\CE0_Backstab.Zargabad\overview_ce0_ca' width='200'/><br />",
    "This mission features some basic intelligence gathering which reveal points of interest on the map.<br />",
    if !(isNil QMODULE(bomber)) then {"Periodically a <marker name=''>civilian</marker> vehicle will approach the [<marker name='d_bomber'>north entrance</marker>] of the main base and can offer these.<br />"} else {""},
    if !(isNil QMODULE(intel)) then {"By exploring areas of OPFOR activity you may discover an <marker name=''>evidence file</marker> that can be retrieved and brought to base.<br />"} else {""},
    "These missions show in the form of <marker name=''>markers</marker>, and are not persistently tracked like tasks due to their small scope.<br />",
    "Once a mission have been sufficiently investigated the marker will <marker name=''>disappear</marker> to indicate it is complete.<br />",
    "These are <marker name=''>not</marker> side missions, nor a replacement for them, but just something additional that can be done."
]] call FUNC(diary,create);