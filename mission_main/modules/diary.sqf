/**
 * Mission Main Module - Diary Submodule
 */

#include "x_macros.sqf"

["Main Target", [
    "<img image='ca\ui\data\template_thumb_ca' width='200'/><br />",
    "In order to complete a Main Target the following conditions <marker name=''>must</marker> be met:<br />",
    format ["- All camps (%1) must be <marker name=''>captured</marker>, to weaken enemy foothold.", GVAR(mission_main_amount_camps)],
    format ["- All radio towers (%1) must be <marker name=''>destroyed</marker>, to stop enemy reinforcements.", GVAR(mission_main_amount_radios)],
    "- Most occupied enemy vehicles must be <marker name=''>destroyed</marker>.",
    format ["- Alive enemy infantry units <marker name=''>cannot</marker> exceed %1.", GVAR(mission_main_threshold_infantry)]
]] call FUNC(diary,create);