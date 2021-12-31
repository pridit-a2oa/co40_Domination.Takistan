/**
 * Base R&D Module - Board Submodule
 */

#include "x_macros.sqf"

"Research & Development" hintC [
    "This server features a mechanic that enables players to construct OPFOR vehicles that have been researched.",
	"To work towards research of a vehicle you will need to find them out in the world and place them on the pad.",
	"You can only perform R&D actions near the pad, which can be found to the south west of the nearest hangars as you spawn at the base.",
	format ["By deconstructing vehicles you will earn %1 score each time.", GVAR(base_rd_amount_score)]
];