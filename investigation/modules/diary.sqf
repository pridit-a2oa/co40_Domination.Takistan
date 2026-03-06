/**
 * Investigation Module - Diary Submodule
 */

#include "x_macros.sqf"

["Investigations", [
    "<img image='ca\missions_e\campaign\missions\CE0_Backstab.Zargabad\overview_ce0_ca' width='175'/>",
    if !(isNil QMODULE(vehicle_bomber)) then {"<br />Periodically a civilian vehicle will approach the <marker name='d_bomber'>[North Entrance]</marker> of the base and can offer areas to investigate."} else {""},
    "<br />These areas show in the form of <marker name=''>markers</marker>, and are not persistently tracked like tasks due to their limited scope.",
    "<br />Once an area has been sufficiently investigated the marker will <marker name=''>disappear</marker> to indicate completion."
]] call FUNC(diary,create);