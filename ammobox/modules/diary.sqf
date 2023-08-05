/**
 * Ammobox Module - Diary Submodule
 */

#include "x_macros.sqf"

["Ammoboxes", [
    "<img image='ca\missions_e\bootcamp\TE03_Shooting_range.Zargabad\overview_ca' width='200'/>",
    "<br />Large US Ammoboxes contain <marker name=''>most</marker>, but not all (for balancing reasons or otherwise), weapons and items across factions.",
    if !(isNil QMODULE(base_ammobox)) then {"<br />There will always be a periodically replenished <marker name='d_player_ammobox_pos'>[Ammobox]</marker> at base, just ahead of where you first spawn."} else {""},
    if !(isNil QMODULE(vehicle_ammobox)) then {"<br />Some vehicles are able to load an ammobox, either from the field or via the <marker name='ammoload'>[Ammobox Load Point]</marker>."} else {""},
    if !(isNil QMODULE(perk) && {isNil QMODULE(airdrop)}) then {"<br />The default airdrop payload will <marker name=''>always</marker> be an ammobox."} else {""}
]] call FUNC(diary,create);