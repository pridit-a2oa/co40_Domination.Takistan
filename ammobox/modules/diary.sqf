/**
 * Ammobox Module - Diary Submodule
 */

#include "x_macros.sqf"

["Ammoboxes", [
    "<img image='ca\missions_e\bootcamp\TE03_Shooting_range.Zargabad\overview_ca' width='175'/>",
    "<br />US Army Vehicle Ammo boxes contain most, but not all, weapons and items across all sides.",
    if !(isNil QMODULE(base_ammobox)) then {"<br />There will always be a periodically replenished <marker name='d_player_ammobox_pos'>[Ammobox]</marker> at base."} else {""},
    if !(isNil QMODULE(vehicle_ammobox)) then {"<br />Some vehicles are able to carry an ammobox, either from the field or via the <marker name='ammoload'>[Ammobox Load Point]</marker>."} else {""},
    "<br />OPFOR ammoboxes will always contain a <marker name=''>limited subset</marker> of weaponry, dependent on the type.",
    if !(isNil QMODULE(perk) && {isNil QMODULE(airdrop)}) then {"<br />The <marker name=''>default airdrop payload</marker> will always be an ammobox."} else {""}
]] call FUNC(diary,create);