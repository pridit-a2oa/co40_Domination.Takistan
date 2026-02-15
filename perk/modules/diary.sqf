/**
 * Perk Module - Diary Submodule
 */

#include "x_macros.sqf"

["Perks", [
    "<img image='ca\missions_e\bootcamp\TE12_Supports.Zargabad\overview_ca' width='175'/>",
    "<br />This is the main <marker name=''>progression</marker> system within the mission, providing support options and abilities as reward for effort.",
    format [
        "<br />Perk points must be earned and are awarded every <marker name=''>%1</marker> score. Acquiring <marker name=''>%2</marker> score will allow unlocking every available perk.",
        GVAR(perk_amount_score),
        GVAR(perk_amount_score) * 8
    ],
    "<br />You can only unlock the bottom perks for your current role. This is indicated by a <marker name=''>highlighted arrow</marker> above the column.",
    "<br />Role based perks <marker name=''>must be unlocked in sequence</marker>, starting with the first one at the top and then continuing down.",
    "<br />Unlocked perks <marker name=''>do not persist</marker> between switching roles. On reconnect you receive points to re-allocate dependant on score.",
    "<br />Score, and by extension any unlocked perks and unused points, are <marker name=''>reset</marker> every server restart."
]] call FUNC(diary,create);