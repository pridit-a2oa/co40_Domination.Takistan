#include "x_macros.sqf"
private ["_placement", "_position", "_direction", "_objects", "_group"];

PARAMS_1(_placement);

_position = _placement select 0;
_direction = _placement select 1;

if !([count (nearestObjects [_position, ["Land_tent_east"], 2000]), 0] call BIS_fnc_areEqual) exitWith {false};

_objects = [
    _position,
    _direction,
    GVAR(event_roadblock_composition),
    [
        ["FoldChair"],
        ["FoldTable", "TKBasicWeapons_EP1"],
        ["Fort_RazorWire", "ZavoraAnim"],
        ["HMMWV_M1151_M2_DES_EP1", "LandRover_MG_TK_EP1"],
        ["Land_BagFenceLong"],
        ["Land_fort_bagfence_corner"],
        ["Land_fort_bagfence_long", "Land_CncBlock"],
        ["Land_Fort_Watchtower_EP1", "Land_tent_east", 90],
        ["Land_fortified_nest_small", "KORD_high_TK_EP1", 180],
        ["Land_HBarrier3", "Fort_Crate_wood"],
        ["Land_HBarrier_large"],
        ["Land_Toilet"],
        ["Paleta1"],
        ["RoadBarrier_light", "Sign_Checkpoint_TK_EP1"],
        ["RoadBarrier_long", "ZavoraAnim"],
        ["SearchLight_US_EP1", "SearchLight_TK_EP1"]
    ]
] call FUNC(server,objectMapper);

_group = [
    _position,
    east,
    (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySectionMG")
] call FUNC(server,spawnGroup);

if !(isNil QMODULE(unit)) then {
    [_group, _position] call FUNC(unit,defend);
};

[
    _position,
    _objects,
    units _group
]