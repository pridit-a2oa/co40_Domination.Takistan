/**
 * Base Wreck Module - Diary Submodule
 */

#include "x_macros.sqf"

["Vehicle Wrecks", [
    "<img image='ca\missions_e\bootcamp\TE10_Attack_helicopter.Takistan\overview_ca' width='175'/>",
    "<br />Upon destruction, some vehicles do not respawn and will instead produce a wreck that must be rebuilt to reuse.",
    "<br />These wrecked vehicles <marker name=''>must be airlifted</marker> one at a time and dropped onto the <marker name='wreck_rebuild'>[Wreck Rebuild]</marker> pad.",
    "<br />Only wrecked vehicles tracked by an associated <marker name=''>map marker</marker> are considered to be rebuildable.",
    "<br />Vehicle wrecks (which are not being actively lifted) will <marker name=''>always be visible</marker> via a map marker.",
    "<br />Once a vehicle has been rebuilt it will be <marker name=''>automatically moved</marker> into an empty adjacent hangar.",
    "<br />OPFOR vehicles have a <marker name=''>random chance</marker> to produce a rebuildable wreck upon destruction."
]] call FUNC(diary,create);