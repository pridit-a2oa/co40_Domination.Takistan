#define THIS_MODULE drag
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_target setVariable [QGVAR(dragging), true, true];

player playAction "grabDrag";
player forceWalk true;

[true, "switchMove", [_target, "AinjPpneMstpSnonWrflDb_still"]] call FUNC(network,mp);

_target attachTo [player, [0, 1, 0]];

[true, "setDir", [_target, (getDir player) - 180]] call FUNC(network,mp);

_action = player addAction ["Drop" call FUNC(common,RedText), __function(drop), _target, 10, false, true, "", ""];

while {_target getVariable QGVAR(dragging)} do {
    if (!alive player || {player getVariable QGVAR(unconscious)}) exitWith {
        [true, "switchAction", [_target, "Die"]] call FUNC(network,mp);
    };
    
    if (!alive _target || {!(_target getVariable QGVAR(unconscious))}) exitWith {};
};

if (alive player) then {
    player switchMove "";
    player forceWalk false;
    player removeAction _action;
};

_target setVariable [QGVAR(dragging), false, true];

detach _target;