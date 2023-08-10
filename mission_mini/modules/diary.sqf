/**
 * Mission Mini Module - Diary Submodule
 */

#include "x_macros.sqf"

["Mini Missions", [
    "<img image='ca\missions_e\campaign\missions\CE0_Backstab.Zargabad\overview_ce0_ca' width='200'/>",
    "<br />This server features some basic intelligence gathering which can reveal points of interest on the map.",
    if !(isNil QMODULE(bomber)) then {"<br />Periodically a <marker name=''>civilian</marker> vehicle will approach the <marker name='d_bomber'>[North Entrance]</marker> of the main base and can offer these."} else {""},
    "<br />These missions show in the form of <marker name=''>markers</marker>, and are not persistently tracked like tasks due to their small scope.",
    "<br />Once a mission have been sufficiently investigated the marker will <marker name=''>disappear</marker> to indicate it is complete.",
    if !(isNil QMODULE(intel)) then {"<br />Separately, by exploring areas of OPFOR activity you may discover an <marker name=''>evidence file</marker> that can be taken and brought to base."} else {""}
]] call FUNC(diary,create);