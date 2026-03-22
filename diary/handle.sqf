/**
 * Diary Module (Handler)
 */

#define THIS_MODULE diary
#include "x_macros.sqf"

if (hasInterface) then {
    private ["_roles"];

    if (!isNil QMODULE(vote)) then {
        __submodulePP(vote);
    };

    if (!isNil QMODULE(base_wreck)) then {
        __submodulePP(base_wreck);
    };

    if (!isNil QMODULE(vehicle_upgrade)) then {
        __submodulePP(vehicle_upgrade);
    };

    if (!isNil QMODULE(vehicle_uav)) then {
        __submodulePP(vehicle_uav);
    };

    if (!isNil QMODULE(vehicle_service)) then {
        __submodulePP(vehicle_service);
    };

    if (!isNil QMODULE(vehicle_cargo)) then {
        __submodulePP(vehicle_cargo);
    };

    if (!isNil QMODULE(setting)) then {
        __submodulePP(setting);
    };

    _roles = "";

    {
        _roles = _roles + format ["<br />- %1x %2 [%3]", _x select 0, _x select 2, _x select 1];
    } forEach GVAR(roles);

    ["Roles", [
        "<img image='ca\missions_e\data\images\mpte05_ca' width='175'/>",
        format ["<br />There are a total of %1 slots, comprised of the following %2 roles:", getNumber (missionConfigFile >> "Header" >> "maxPlayers"), count GVAR(roles)],
        _roles,
        if !(isNil QMODULE(squad)) then {"<br />Each of these roles have their own designated squad, which will be <marker name=''>automatically joined</marker> on spawn."} else {""},
        "<br />A limited amount of roles provide <marker name=''>inherent functions</marker>. These are as follows:",
        "<br />- Artillery Operators can use the artillery computer (excluding with OPFOR cannons).",
        format ["- Medics can always self-heal or heal other players, without requiring a medkit%1.", if !(isNil QMODULE(revive)) then {", and revive players to full health"} else {""}],
        "<br />Due to a <marker name=''>game limitation</marker> medics are not able to equip a backpack, and BAF units have less gear slots.",
        format ["<br />With exception of the above%1, restrictions are <marker name=''>not imposed</marker> on the basis of role.", if !(isNil QMODULE(perk)) then {", and perks"} else {""}]
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

    if (!isNil QMODULE(mission_main)) then {
        __submodulePP(mission_main);
    };

    if (!isNil QMODULE(investigation)) then {
        __submodulePP(investigation);
    };

    ["Fast Travel", [
        "<img image='ca\missions_e\bootcamp\TE06_Parachute.Zargabad\overview_ca' width='175'/>",
        "<br />Approaching the <marker name='teleport_[8622.05,2454.22,-315.322]'>[Fast Travel]</marker> flag at base will reveal all available options for immediate travel.",
        if !(isNil QMODULE(vehicle_deploy)) then {"<br />Vehicles that are actively <marker name=''>deployed</marker> are the only mobile units able to be fast traveled to."} else {""},
        if !(isNil QMODULE(mission_main)) then {"<br />Once a main target has been <marker name=''>seized</marker> a fast travel flag will be available to use within the area."} else {""},
        if !(isNil QMODULE(mission_main)) then {"<br />The flag generated from completion of main targets <marker name=''>cannot</marker> be used to HALO jump - this is a base facility."} else {""},
        if !(isNil QMODULE(halo)) then {format ["<br />As a passenger of an aircraft with a lowered ramp you can perform a HALO jump at will, as long as <marker name=''>above</marker> %1m.", GVAR(halo_distance_minimum)]} else {""}
    ]] call FUNC(THIS_MODULE,create);

    if (!isNil QMODULE(event)) then {
        __submodulePP(event);
    };

    if (!isNil QMODULE(construction)) then {
        __submodulePP(construction);
    };

    if (!isNil QMODULE(ammobox)) then {
        __submodulePP(ammobox);
    };

    if (!isNil QMODULE(admin)) then {
        __submodulePP(admin);
    };

    if (!isNil QMODULE(accolade)) then {
        __submodulePP(accolade);
    };
};