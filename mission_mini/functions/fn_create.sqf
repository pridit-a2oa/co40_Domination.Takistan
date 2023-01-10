#define THIS_MODULE mission_mini
#include "x_macros.sqf"
private ["_type", "_missions", "_mission"];

PARAMS_1(_type);

_missions = GVAR(mission_mini_types);

if (count _missions < 1) exitWith {};

_mission = _missions call BIS_fnc_selectRandom;

_position = [
    markerPos QGVAR(base_south),
    GVAR(mission_mini_distance_base) select 0,
    GVAR(mission_mini_distance_base) select 1,
    10,
    0,
    0.1,
    0
] call FUNC(common,safePos);

_name = format ["mission_mini_%1", str _position];

GVAR(intel_trigger) = createTrigger ["EmptyDetector", _position];
GVAR(intel_trigger) setTriggerArea [200, 200, 0, false];
GVAR(intel_trigger) setTriggerActivation ["WEST", "PRESENT", false];

if (!isNil QMODULE(marker)) then {
    [true, "spawn", [[_position, _name], {
        private ["_position", "_name"];

        PARAMS_2(_position, _name);

        if (!isNil QMODULE(marker)) then {
            [
                _name,
                _position,
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
    
    GVAR(intel_trigger) setVariable ["marker", _name];
};

if !(isNil QMODULE(conversation)) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Target"],
        [
            ["1", {}, _type, []],
            ["2", {}, toLower (_mission select 1), []]
        ]
    ] call FUNC(conversation,radio);
};

_handle = format ["mission_mini\missions\%1", _mission select 0];

[_position] __handler(_handle);