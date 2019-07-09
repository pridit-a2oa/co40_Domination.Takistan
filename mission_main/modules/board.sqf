/**
 * Mission Main Module - Board Submodule
 */

#include "x_macros.sqf"

"Main Targets" hintC [
    "In order to complete a Main Target the following conditions must be met:",
    format ["All camps (%1) must be captured, to weaken enemy foothold.", GVAR(mission_main_amount_camps)],
    format ["All radio towers (%1) destroyed, to stop reinforcements.", GVAR(mission_main_amount_radios)],
    "Most occupied enemy vehicles must be destroyed.",
    format ["Alive enemy infantry units cannot exceed %1.", GVAR(mission_main_threshold_infantry)]
];