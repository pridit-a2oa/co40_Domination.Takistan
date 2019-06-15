#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_targets = [];

{
    if (_x != _target) then {
        _targets = _targets + [_x]
    };
} forEach GVAR(mission_main_targets);

GVAR(mission_main_targets) = _targets;