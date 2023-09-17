#include "x_macros.sqf"
private ["_type", "_position", "_direction", "_roads", "_objects", "_group", "_location", "_trigger"];

PARAMS_3(_type, _position, _direction);

_roads = [_position, 300] call FUNC(server,nearRoads);

if ([_roads, []] call BIS_fnc_areEqual) exitWith {false};

_objects = [
    _position,
    _direction + ([_position, _roads select 0] call BIS_fnc_dirTo),
    _type select 0,
    _type select 1
] call FUNC(server,objectMapper);

_group = [
    _position,
    east,
    (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")
] call FUNC(server,spawnGroup);

_trigger = createTrigger ["EmptyDetector", _position];
_trigger setVariable ["entities", _objects + units _group];
_trigger setVariable ["units", units _group];
_trigger setTriggerStatements [
    "({!alive _x} count (thisTrigger getVariable ""units"")) > 2",
    "[thisTrigger] call d_fnc_mission_mini_complete",
    ""
];

if !(isNil QMODULE(unit)) then {
    [_group, _position] call FUNC(unit,defend);
};

[_position, _trigger]