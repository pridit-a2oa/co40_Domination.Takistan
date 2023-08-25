/**
 * Mission Main Module - Diary Submodule
 */

#include "x_macros.sqf"

["Main Missions", [
    "<img image='ca\ui\data\template_thumb_ca' width='200'/>",
    "<br />Main Missions are towns heavily occupied by Takistani forces, which you are tasked with <marker name=''>seizing</marker> control of.",
    "<br />They are also referred to as Main Targets or, more commonly known as, the ""AO"" (area of operations).",
    "<br />These missions are dynamically generated, and <marker name=''>do not</marker> have a defined end, with old completed targets periodically recycled.",
    "<br />In order to complete one of these missions the following conditions <marker name=''>must</marker> be met:",
    format ["<br />- Alive infantry <marker name=''>cannot</marker> exceed %1.", GVAR(mission_main_threshold_infantry)],
    format ["- Camps (%1) must be <marker name=''>captured</marker> to weaken their foothold.", GVAR(mission_main_amount_camps)],
    format ["- Radio towers (%1) must be <marker name=''>destroyed</marker> to prevent reinforcements.", GVAR(mission_main_amount_radios)],
    "- Most actively occupied vehicles must be <marker name=''>destroyed</marker> or outside of the area.",
    "<br />In order to prevent railroading conditions the following restrictions are in place:",
    "<br />- Artillery fire (except perk) on radio towers are <marker name=''>ineffective</marker>, as well as vehicle fire (except bombs) unless close.",
    "- Camps <marker name=''>cannot</marker> be captured with an active enemy presence in the immediate area, and only on foot."
]] call FUNC(diary,create);