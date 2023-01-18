#include "x_macros.sqf"
private ["_position"];

PARAMS_1(_position);

_objects = [
    _position,
    random 360,
    GVAR(mission_mini_encampment_type)
] call FUNC(server,objectMapper);

_group = [
    _position,
    east,
    (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")
] call FUNC(server,spawnGroup);

GVAR(mission_mini_cleanup) = _objects + units _group;

if (!isNil QMODULE(marker)) then {
    GVAR(intel_trigger) = createTrigger ["EmptyDetector", _position];
    GVAR(intel_trigger) setVariable ["units", units _group];
    GVAR(intel_trigger) setTriggerStatements [
        "({!alive _x} count (thisTrigger getVariable ""units"")) > 2",
        "[thisTrigger] call d_fnc_mission_mini_complete",
        ""
    ];
};

if (!isNil QMODULE(unit)) then {
    [_group, _position] call FUNC(unit,defend);
};

_position