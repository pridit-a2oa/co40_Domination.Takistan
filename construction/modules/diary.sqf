/**
 * Construction Module - Diary Submodule
 */

#include "x_macros.sqf"

["Construction", [
    "<img image='ca\missions_e\bootcamp\TE14_Construction.Zargabad\overview_ca' width='175'/><br />",
    "You are able to <marker name=''>construct</marker> various objects, some of these with functionality.<br />",
    if !(isNil QMODULE(perk)) then {"These objects can be unlocked through <marker name=''>perks</marker>, specifically role based.<br />"} else {""},
    format ["Constructed objects have a lifetime of <marker name=''>%1</marker> minutes before being cleared.", GVAR(construction_time_lifetime) / 60]
]] call FUNC(diary,create);