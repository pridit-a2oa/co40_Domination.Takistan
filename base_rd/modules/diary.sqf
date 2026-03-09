/**
 * Base R&D Module - Diary Submodule
 */

#include "x_macros.sqf"

["Research & Development (R&D)", [
    "<img image='ca\missions_e\scenarios\SPE1_Vehicles_TKA.Zargabad\overview_vehicles_ca' width='175'/>",
    "<br />Research is fundamentally performed via <marker name=''>reverse engineering</marker>, which means you need an existing vehicle to deconstruct.",
    "<br />By leaving an empty OPFOR vehicle on the <marker name='base_rd'>[R&amp;D]</marker> pad it will automatically begin deconstructing, rendering it <marker name=''>unusable</marker>.",
    "<br />Each vehicle type has its own progress requirement (amount that <marker name=''>must be deconstructed</marker>) to be able to build.",
    "<br />Some OPFOR vehicles are excluded and <marker name=''>incompatible</marker> with this facility.",
    if !(isNil QMODULE(database)) then {"<br />R&amp;D progress persists through server restarts, but will <marker name=''>reset</marker> every few days."} else {""}
]] call FUNC(diary,create);