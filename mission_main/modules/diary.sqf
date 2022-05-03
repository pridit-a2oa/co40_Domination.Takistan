/**
 * Mission Main Module - Diary Submodule
 */

#include "x_macros.sqf"

["Main Target", [
    "<img image='ca\ui\data\template_thumb_ca' width='200'/><br />",
    "Main Targets are towns occupied by Takistan forces, and are the main antagonist of the mission.<br />",
    "These targets are dynamically generated, and <marker name=''>do not</marker> have a defined end, with old completed targets periodically recycled.<br />",
    "In order to complete a Main Target the following conditions <marker name=''>must</marker> be met:<br />",
    format ["- Camps (%1) must be <marker name=''>captured</marker>, to weaken their foothold.", GVAR(mission_main_amount_camps)],
    format ["- Radio towers (%1) must be <marker name=''>destroyed</marker>, to prevent reinforcements.", GVAR(mission_main_amount_radios)],
    "- Most actively occupied vehicles must be <marker name=''>destroyed</marker> or outside of the area.",
    format ["- Alive infantry <marker name=''>cannot</marker> exceed %1.<br />", GVAR(mission_main_threshold_infantry)],
    "Camps <marker name=''>cannot</marker> be captured with an active enemy presence in the immediate area, or from within aircraft.<br"
]] call FUNC(diary,create);