/**
 * Base R&D Module - Diary Submodule
 */

#include "x_macros.sqf"

["Research & Development", [
    "<img image='ca\missions_e\scenarios\SPE1_Vehicles_TKA.Zargabad\overview_vehicles_ca' width='200'/><br />",
    "You are able to <marker name=''>construct</marker>, or work towards being able to construct (by researching), most (not all) OPFOR vehicles.<br />",
    "To research vehicles you will need to find them out in the world and place them on the R&amp;D pad.<br />",
    "Researching will initiate a <marker name=''>deconstruct</marker> process during which vehicles <marker name=''>cannot</marker> be constructed.<br />",
    "The R&amp;D pad has a marker and is located towards the <marker name='base_rd'>south</marker> of the main base.<br />",
    format ["By deconstructing vehicles you earn <marker name=''>%1</marker> score.", GVAR(base_rd_amount_score)]
]] call FUNC(diary,create);