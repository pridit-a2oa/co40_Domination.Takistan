/**
 * Vehicle Upgrade Module - Diary Submodule
 */

#include "x_macros.sqf"

["Vehicle Upgrades", [
    "<img image='vehicle_upgrade\textures\overview_ca.paa' width='200'/>",
    "<br />As an engineer, it is possible to upgrade (convert) the Stryker (MHQ) into a weaponized variant at the base.",
    "<br />Through Options -> Settings the desired type can be selected for when using the vehicle menu action.",
    "<br />Any role is able to <marker name=''>revert</marker> conversions (back to MEV), but weaponized variants <marker name=''>require</marker> the perk.",
    "<br />Non-MEV variants of the Stryker will be <marker name=''>unable</marker> to load an ammobox and create vehicles.",
    "<br />Upon destruction any converted Stryker will <marker name=''>respawn</marker> as the MEV."
]] call FUNC(diary,create);