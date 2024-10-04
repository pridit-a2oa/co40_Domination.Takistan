#include "x_macros.sqf"
private ["_placement", "_position", "_direction", "_objects", "_group"];

PARAMS_1(_placement);

_position = _placement select 0;
_direction = _placement select 1;

if !([count (nearestObjects [_position, ["Land_tent_east", "Land_Com_tower_ep1"], 2000]), 0] call BIS_fnc_areEqual) exitWith {false};

_objects = [
    _position,
    _direction,
    GVAR(event_tower_composition),
    [
        ["KORD_TK_EP1", "Paleta1", 50],
        ["SearchLight_TK_EP1", "KORD_high_TK_EP1"],
        ["TKBasicAmmunitionBox_EP1"],
        ["TKLaunchers_EP1"],
        ["ZSU_TK_EP1", "Land_Com_tower_ep1"]
    ]
] call FUNC(server,objectMapper);

_group = [
    _position,
    east,
    (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySectionAA")
] call FUNC(server,spawnGroup);

if !(isNil QMODULE(unit)) then {
    [_group, _position] call FUNC(unit,defend);
};

[
    _position,
    _objects,
    units _group
]