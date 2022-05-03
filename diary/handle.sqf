/**
 * Diary Module (Handler)
 */

#define THIS_MODULE diary
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(base_wreck)) then {
        __submodulePP(base_wreck);
    };

    ["Travel", [
        "<img image='ca\missions_e\bootcamp\TE06_Parachute.Zargabad\overview_ca' width='200'/><br />",
        "There are <marker name=''>several</marker> ways to navigate around the map, either quickly or slowly.<br />",
        "Approaching the [<marker name='teleport_Loy Manara'>flag</marker>] at base will reveal options to <marker name=''>Fast Travel</marker> and <marker name=''>HALO Jump</marker>.<br />",
        "Only vehicles that are actively <marker name=''>deployed</marker> can be fast travelled to and from.<br />",
        "Once a main target has been captured, a fast travel <marker name=''>flag</marker> will be available to use within the area."
    ]] call FUNC(THIS_MODULE,create);

    if (!isNil QMODULE(squad)) then {
        __submodulePP(squad);
    };

    if (!isNil QMODULE(setting)) then {
        __submodulePP(setting);
    };

    if (!isNil QMODULE(base_rd)) then {
        __submodulePP(base_rd);
    };

    if (!isNil QMODULE(perk)) then {
        __submodulePP(perk);
    };

    if (!isNil QMODULE(vehicle_deploy)) then {
        __submodulePP(vehicle_deploy);
    };

    if (!isNil QMODULE(mission_main)) then {
        __submodulePP(mission_main);
    };

    if (!isNil QMODULE(intel)) then {
        __submodulePP(intel);
    };

    if (!isNil QMODULE(construction)) then {
        __submodulePP(construction);
    };

    ["Classes", [
        "<img image='ca\missions_e\data\images\mpte05_ca' width='200'/><br />",
        "The primary purpose of class selection is to determine which role based <marker name=''>perks</marker> you can unlock.<br />",
        "A limited amount of classes provide <marker name=''>inherent functions</marker>, they are as follows:<br />",
        "- Artillery Operators are able to use the artillery computer.",
        "- Medics can heal self or other players, without requiring a medkit.<br />",
        "With exception of the above, restrictions are <marker name=''>not</marker> imposed (scripting wise) on the basis of class.<br />",
        "Due to an <marker name=''>engine limitation</marker> medics are not able to equip a backpack, and non-special forces units have less gear slots."
    ]] call FUNC(THIS_MODULE,create);
};