/**
 * Vehicle Upgrade Module - Diary Submodule
 */

#include "x_macros.sqf"

["Vehicle Upgrades", [
    "<img image='vehicle_upgrade\textures\overview_ca.paa' width='175'/>",
    "<br />The Stryker (MHQ) vehicles can be upgraded (converted) into variants at the base.",
    "<br />These variants may have some unique armament and utility but <marker name=''>all</marker> can act as mobile respawn.",
    "<br />Through Options -> Settings the desired type can be selected for when using the vehicle menu action.",
    "<br />Some variants <marker name=''>require</marker> the engineer perk, but any role is able to <marker name=''>revert</marker> conversions (back to CV/MEV).",
    "<br />Upon destruction any converted Stryker will <marker name=''>respawn</marker> as its original."
]] call FUNC(diary,create);