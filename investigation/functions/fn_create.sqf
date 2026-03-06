#define THIS_MODULE investigation
#include "x_macros.sqf"
private ["_investigation", "_target"];

if ([GVAR(investigation_types), []] call BIS_fnc_areEqual) exitWith {};

_investigation = [_this, 0, GVAR(investigation_types) call BIS_fnc_selectRandom] call FUNC(common,param);

while {isNil "_target" || {[typeName _target, "BOOL"] call BIS_fnc_areEqual}} do {
    private ["_position"];

    _position = [
        markerPos QGVAR(base_south),
        GVAR(investigation_distance_base) select 0,
        GVAR(investigation_distance_base) select 1,
        10,
        0,
        0.1,
        0
    ] call FUNC(common,safePos);

    _target = [_position] call (call compile format [
        "d_fnc_%1_%2_create",
        QUOTE(THIS_MODULE),
        _investigation select 0
    ]);

    sleep 0.5;
};

(_target select 1) setTriggerArea [200, 200, 0, false];
(_target select 1) setTriggerActivation ["WEST", "PRESENT", false];

if !(isNil QMODULE(marker)) then {
    private ["_name"];

    _name = format ["investigation_%1", _target select 0];

    [true, "spawn", [[_target select 0, _name], {
        private ["_target", "_name", "_position"];

        PARAMS_2(_target, _name);

        _position = [_target, random 80, random 360] call BIS_fnc_relPos;

        if !(isNil QMODULE(marker)) then {
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

            [
                format ["%1_radius", _name],
                _position,
                "",
                "",
                "ColorYellow",
                0.6,
                "ELLIPSE",
                "Solid",
                [100, 100]
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
            ["1", {}, toLower (_investigation select 1), []]
        ]
    ] call FUNC(conversation,radio);
};

__log format ["Seeded %1", _investigation select 1]];