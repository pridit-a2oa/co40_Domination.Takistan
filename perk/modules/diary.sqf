/**
 * Perk Module - Diary Submodule
 */

#include "x_macros.sqf"

["Perks", [
    "<img image='ca\missions_e\bootcamp\TE12_Supports.Zargabad\overview_ca' width='200'/><br />",
    "This is the main <marker name=''>progression</marker> system within the mission, providing support options and abilities as reward for contribution.<br />",
    format [
        "Perk points must be earned and are awarded every <marker name=''>%1</marker> score. Acquiring <marker name=''>%2</marker> score will allow unlocking every available perk.<br />",
        GVAR(perk_amount_score),
        GVAR(perk_amount_score) * 7
    ],
    "You can only unlock the bottom perks for your current role. This is indicated by a <marker name=''>white arrow</marker> above the column.<br />",
    "Role based perks <marker name=''>must be unlocked in sequence</marker>, starting with the first one at the top and then continuing down.<br />",
    "Unlocked perks <marker name=''>do not persist</marker> between switching roles. On reconnect you receive points to re-allocate dependant on score.<br />",
    "Score, and by extension any unlocked perks and unused points, are <marker name=''>reset</marker> every server restart."
]] call FUNC(diary,create);