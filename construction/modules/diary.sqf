/**
 * Construction Module - Diary Submodule
 */

#include "x_macros.sqf"
private ["_constructs"];

_constructs = "";

{
    if !(isNil format ["d_mdl_construction_%1", _x select 0]) then {
        _constructs = _constructs + ("<br />- " + (_x select 1));
    };
} forEach [
    ["farp", "FARP: Repair and refuel vehicles."],
    ["fortification", "Fortification: Defensive capability."],
    ["mash", "MASH: Heal and respawn point."],
    ["nest", "MG Nest: Cover and an emplaced machine gun."]
];

["Construction", [
    "<img image='ca\missions_e\bootcamp\TE14_Construction.Zargabad\overview_ca' width='175'/>",
    "<br />You are able to <marker name=''>construct objects</marker> in the field, most of these with utility:",
    _constructs,
    if !(isNil QMODULE(perk)) then {"<br />These objects are <marker name=''>only made available</marker> via perks, specifically role based."} else {""},
    "<br />Objects can only be deconstructed for the <marker name=''>lifetime of the session</marker>, meaning any rejoin will void ownership.",
    format ["<br />All constructions have a maximum lifetime of <marker name=''>%1 minutes</marker> before being considered abandoned and cleared.", GVAR(construction_time_lifetime) / 60]
]] call FUNC(diary,create);