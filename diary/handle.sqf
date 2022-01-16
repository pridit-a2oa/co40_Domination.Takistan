/**
 * Diary Module (Handler)
 */

#define THIS_MODULE diary
#include "x_macros.sqf"

if (hasInterface) then {
	["Tips", [
		"<img image='ca\missions_e\campaign\missions\CE8_scenePressConf.Zargabad\overview_ce8_ca' width='200'/><br />",
		"Construction: Objects constructed, that have been gained through perks, have a lifetime of 30 minutes before disappearing.<br />",
		"Perks: Medkits are replenished at medical tents. Repair kits are replenished at vehicle service point structures (i.e. ammo point or land vehicle service).<br />",
		"Perks: One medkit &amp; one repair kit can be given to other players, should they not have them.<br />",
		"Roles: Medics are able to heal other players, should they be injured. While this may seem obvious, this is the only class to have an inherent function.<br />",
		"Squads: Leaving any of the default squads puts you in a new, empty squad. Squads can be joined by other players via a context action on your body.<br />",
		"Wrecks: Only wrecks designated on the map can be rebuilt. Wrecks without markers can still be lifted, but can't be rebuilt."
	]] call FUNC(THIS_MODULE,create);

	if (!isNil QMODULE(setting)) then {
		__submodulePP(setting);
	};

	["Roles", [
		"<img image='ca\missions_e\bootcamp\TE11_Team_command.Zargabad\overview_ca' width='200'/><br />",
    	"The primary purpose of class selection is to determine which role based perks you can unlock.<br />",
    	"Aside from Medic, these classes do not automatically grant you any special ability outside of those unlocked via perks.<br />",
    	"In a similar fashion, no restrictions (such as limited weapons) are placed on the basis of class.<br />",
    	"Please note that medics are not able to equip a backpack, and the non-special forces classes have less gear slots. This is an engine limitation."
	]] call FUNC(THIS_MODULE,create);

	if (!isNil QMODULE(base_rd)) then {
		__submodulePP(base_rd);
	};

	if (!isNil QMODULE(perk)) then {
		__submodulePP(perk);
	};

	if (!isNil QMODULE(mission_main)) then {
		__submodulePP(mission_main);
	};

	if (!isNil QMODULE(intel)) then {
		__submodulePP(intel);
	};

	
};