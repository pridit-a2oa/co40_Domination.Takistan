#define THIS_MODULE drag
#include "x_macros.sqf"
private ["_target", "_action"];

PARAMS_1(_target);

_target setVariable [QGVAR(dragging), true, true];

player playAction "grabdrag";
player forceWalk true;

[true, "switchMove", [_target, "AinjPpneMstpSnonWrflDb_still"]] call FUNC(network,mp);

_target attachTo [player, [0, 1, 0]];

[true, "setDir", [_target, 180]] call FUNC(network,mp);

_action = player addAction [
    "Drop" call FUNC(common,RedText),
    __function(drop),
    _target,
    10,
    false,
    true,
    "",
    ""
];

waitUntil {
    sleep 0.1;
    
    {!alive _x} count [player, _target] > 0 || {player getVariable QGVAR(unconscious)} || {!(_target getVariable QGVAR(dragging))}
};

detach _target;

if (alive _target) then {
    [true, "switchMove", [_target, "AidlPpneMstpSnonWnonDnon_SleepB_death"]] call FUNC(network,mp);
};

if (alive player && {!(player getVariable QGVAR(unconscious))}) then {
    [true, "playMoveNow", [player, "amovpknlmstpsraswrfldnon"]] call FUNC(network,mp);
};

player forceWalk false;
player removeAction _action;

_target setVariable [QGVAR(dragging), false, true];