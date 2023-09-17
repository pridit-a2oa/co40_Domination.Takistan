#define THIS_MODULE mission_mini
#include "x_macros.sqf"
private ["_type", "_mission", "_target", "_name"];

PARAMS_1(_type);

_mission = if !(isNil "_type") then {_type} else {GVAR(mission_mini_types) call BIS_fnc_selectRandom};

if ([count _mission, 0] call BIS_fnc_areEqual) exitWith {};

while {isNil "_target" || {[typeName _target, "BOOL"] call BIS_fnc_areEqual}} do {
    private ["_position"];

    _position = [
        markerPos QGVAR(base_south),
        GVAR(mission_mini_distance_base) select 0,
        GVAR(mission_mini_distance_base) select 1,
        10,
        0,
        0.1,
        0
    ] call FUNC(common,safePos);

    _target = [_position] call (call compile format [
        "d_fnc_%1_%2_create",
        QUOTE(THIS_MODULE),
        _mission select 0
    ]);

    sleep 0.5;
};

_name = format ["mission_mini_%1", str (_target select 0)];

(_target select 1) setTriggerArea [200, 200, 0, false];
(_target select 1) setTriggerActivation ["WEST", "PRESENT", false];

if (!isNil QMODULE(marker)) then {
    [true, "spawn", [[_target select 0, _name], {
        private ["_target", "_name"];

        PARAMS_2(_target, _name);

        if !(isNil QMODULE(marker)) then {
            [
                _name,
                _target,
                "mil_unknown",
                " Investigate",
                "ColorOrange",
                1,
                "ICON",
                "",
                [0.8, 0.8]
            ] call FUNC(marker,create);
        };
    }]] call FUNC(network,mp);
    
    (_target select 1) setVariable ["marker", _name];
};

if !(isNil QMODULE(conversation)) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Target"],
        [
            ["1", {}, toLower (_mission select 1), []]
        ]
    ] call FUNC(conversation,radio);
};

__log format ["Seeded %1", _mission select 1]];