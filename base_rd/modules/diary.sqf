/**
 * Base R&D Module - Diary Submodule
 */

#include "x_macros.sqf"

["Research & Development", [
    "<img image='ca\missions_e\scenarios\SPE1_Vehicles_TKA.Zargabad\overview_vehicles_ca' width='200'/>",
    "<br />Research is fundamentally performed via <marker name=''>reverse engineering</marker>, which means you need an existing vehicle to deconstruct.",
    "<br />By leaving an empty OPFOR vehicle on the R&amp;D pad it will automatically begin deconstructing, rendering it <marker name=''>unusable</marker>.",
    "<br />Each vehicle type has its own progress requirement (amount that <marker name=''>must</marker> be deconstructed) to be able to build.",
    "<br />The R&amp;D pad has a map marker and is located towards the <marker name='base_rd'>[South]</marker> of the main base.",
    "<br />Some OPFOR vehicles are excluded and <marker name=''>cannot</marker> be deconstructed and subsequently built.",
    if !(isNil QMODULE(database)) then {"<br />R&amp;D progress persists through server restarts, but will <marker name=''>reset</marker> every few days."} else {""}
]] call FUNC(diary,create);