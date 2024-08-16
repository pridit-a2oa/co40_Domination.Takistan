#include "x_macros.sqf"
private ["_gesture", "_checks", "_type", "_animation", "_duration"];

PARAMS_1(_gesture);

_checks = [
    [
        ["Gesture", "performed"]
    ] call FUNC(helper,inVehicle),

    [
        ["Gesture", "performed"]
    ] call FUNC(helper,inAir)
];

{
    if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
        hint _x;
    };
} forEach _checks;

if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

_type = ([0, GVAR(gesture_types)] call FUNC(common,arrayValues)) find _gesture;
_type = ((GVAR(gesture_types) select _type) select 1) call BIS_fnc_selectRandom;

_animation = _type select 0;
_duration = _type select 1;

if (!isNil QMODULE(communication)) then {
    ["Gestures", 0] call FUNC(communication,toggle);
};

[true, "switchMove", [player, _animation]] call FUNC(network,mp);

if (_duration > 0) then {
    sleep _duration;

    if (!alive player || {player getVariable QGVAR(unconscious)}) exitWith {};

    [true, "switchMove", [player, ""]] call FUNC(network,mp);
};

if (!isNil QMODULE(communication)) then {
    if (!alive player || {player getVariable QGVAR(unconscious)}) exitWith {};

    ["Gestures", 1] call FUNC(communication,toggle);
};