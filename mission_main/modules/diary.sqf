/**
 * Mission Main Module - Diary Submodule
 */

#include "x_macros.sqf"

["Main Targets", [
    "<img image='ca\ui\data\template_thumb_ca' width='175'/>",
    "<br />Main Targets are towns heavily occupied by Takistani forces, which you are tasked with seizing control of.",
    "<br />They are also referred to as Main Missions or, known more commonly as, the ""AO"" (area of operations).",
    "<br />To complete one of these targets the following conditions <marker name=''>must</marker> be fulfilled:",
    format ["<br />- Alive infantry <marker name=''>cannot</marker> exceed %1.", GVAR(mission_main_threshold_infantry)],
    format ["- Camps (%1) must be <marker name=''>captured</marker> to weaken their foothold.", GVAR(mission_main_amount_camps)],
    format ["- Radio towers (%1) must be <marker name=''>destroyed</marker> to prevent reinforcements.", GVAR(mission_main_amount_radios)],
    "- Most actively occupied vehicles must be <marker name=''>destroyed</marker> or outside of the area.",
    "<br />To ensure a fair and engaging experience the following restrictions are in place:",
    "<br />- Artillery fire (except perk) on radio towers are <marker name=''>ineffective</marker>, as well as some other fire (except bombs) unless close.",
    "- Camps <marker name=''>cannot</marker> be captured with an active enemy presence in the immediate area, and only while disembarked."
]] call FUNC(diary,create);