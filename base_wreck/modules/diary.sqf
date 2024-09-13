/**
 * Base Wreck Module - Diary Submodule
 */

#include "x_macros.sqf"

["Vehicle Wrecks", [
    "<img image='ca\missions_e\bootcamp\TE10_Attack_helicopter.Takistan\overview_ca' width='200'/>",
    "<br />Some vehicles produce a <marker name=''>rebuildable</marker> wreck when they are destroyed.",
    "<br />Vehicle wrecks which are not being actively lifted will <marker name=''>always</marker> be visible on the map.",
    "<br />To restore these vehicles they need to be <marker name=''>airlifted</marker> onto the wreck rebuild pad near the <marker name='wreck_rebuild'>[South West]</marker> of the base.",
    "<br />Once a vehicle has been rebuilt it will be <marker name=''>automatically moved</marker> into an empty adjacent hangar.",
    "<br />OPFOR vehicles also have a random <marker name=''>chance</marker> to produce a rebuildable wreck when they are destroyed.",
    format ["<br />By rebuilding vehicles you can earn up to <marker name=''>%1</marker> score.", GVAR(base_wreck_amount_score_rebuild) + GVAR(base_wreck_amount_score_travel)]
]] call FUNC(diary,create);