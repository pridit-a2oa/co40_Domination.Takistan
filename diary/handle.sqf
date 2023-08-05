/**
 * Diary Module (Handler)
 */

#define THIS_MODULE diary
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(base_wreck)) then {
        __submodulePP(base_wreck);
    };

    if (!isNil QMODULE(squad)) then {
        __submodulePP(squad);
    };

    if (!isNil QMODULE(setting)) then {
        __submodulePP(setting);
    };

    ["Roles", [
        "<img image='ca\missions_e\data\images\mpte05_ca' width='200'/><br />",
        "The 6 available roles are: Artillery Operator, Engineer, Machine Gunner, Marksman, Medic, and Pilot.<br />",
        if !(isNil QMODULE(perk)) then {"The primary purpose of role selection is to determine which role-based <marker name=''>perks</marker> you can unlock.<br />"} else {""},
        "A limited amount of roles provide <marker name=''>inherent functions</marker>. These are as follows:<br />",
        "- Artillery Operators are able to use the artillery computer.",
        "- Medics can heal self or others without requiring a medkit, and revive players to full health.<br />",
        "With exception of the above, restrictions are <marker name=''>not</marker> imposed (scripting wise) on the basis of role.<br />",
        "Due to an <marker name=''>engine limitation</marker> medics are not able to equip a backpack, and non-special forces units have less gear slots."
    ]] call FUNC(THIS_MODULE,create);

    if (!isNil QMODULE(base_rd)) then {
        __submodulePP(base_rd);
    };

    if (!isNil QMODULE(perk)) then {
        __submodulePP(perk);
    };

    if (!isNil QMODULE(vehicle_deploy)) then {
        __submodulePP(vehicle_deploy);
    };

    if (!isNil QMODULE(mission_mini)) then {
        __submodulePP(mission_mini);
    };

    if (!isNil QMODULE(mission_main)) then {
        __submodulePP(mission_main);
    };

    ["Fast Travel", [
        "<img image='ca\missions_e\bootcamp\TE06_Parachute.Zargabad\overview_ca' width='200'/><br />",
        "Approaching the [<marker name='teleport_[8622.05,2454.22,-315.322]'>flag</marker>] at base will reveal options to <marker name=''>Fast Travel</marker> and additionally, <marker name=''>HALO Jump</marker>.<br />",
        "Vehicles that are actively <marker name=''>deployed</marker> are the only mobile units eligible to be fast traveled to.<br />",
        "Once a main target has been captured a fast travel <marker name=''>flag</marker> will be available to use within the area."
    ]] call FUNC(THIS_MODULE,create);

    if (!isNil QMODULE(construction)) then {
        __submodulePP(construction);
    };

    if (!isNil QMODULE(admin)) then {
        __submodulePP(admin);
    };
};