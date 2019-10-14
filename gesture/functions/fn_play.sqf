#include "x_macros.sqf"
private ["_animation", "_duration", "_checks"];

PARAMS_2(_animation, _duration);

_checks = [
    [
        ["Gesture", "performed"]
    ] call FUNC(helper,inVehicle),
    
    [
        ["Gesture", "performed"]
    ] call FUNC(helper,inAir)
];

{
    if (typeName _x == "STRING") exitWith {
        hint _x;
    };
} forEach _checks;

if ({str (_x) == "true"} count _checks < count _checks) exitWith {};

[true, "switchMove", [player, _animation]] call FUNC(network,mp);

if (_duration > 0) then {
    sleep _duration;
    
    if (!alive player || {player getVariable QGVAR(unconscious)}) exitWith {};
    
    [true, "switchMove", [player, ""]] call FUNC(network,mp);
};