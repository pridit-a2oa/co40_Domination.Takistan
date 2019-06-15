#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

[_target] call FUNC(THIS_MODULE,reset);

_time = GVAR(mission_main_time_recycle) + call FUNC(common,time);

waitUntil {_time < call FUNC(common,time)};

// cleanup

[nil, nil, rSpawn, [_target], {
    private ["_target", "_name", "_description"];

    PARAMS_1(_target);

    if (!isNil QMODULE(task)) then {
        player removeSimpleTask (_target getVariable QGVAR(task));
    };
}] call RE;

if (!isNil QMODULE(task)) then {
    [_target getVariable "name"] call FUNC(task,delete);
};

if (!isNil QMODULE(marker)) then {
    [format ["mission_main_%1", _target getVariable "name"]] call FUNC(marker,delete);
};

GVAR(mission_main_targets) = GVAR(mission_main_targets) + [_target];