#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_time"];

PARAMS_1(_target);

[
    position _target,
    GVAR(mission_main_radius_zone),
    GVAR(mission_main_time_recycle),
    _target getVariable QGVAR(cleanup)
] call FUNC(server,cleanup);

if !(isNil QMODULE(teleport)) then {
    [true, "execVM", [[], FUNCTION(teleport,populate)]] call FUNC(network,mp);
};

if !(isNil QMODULE(task)) then {
    [true, "spawn", [[_target], {
        private ["_target", "_name", "_description"];

        PARAMS_1(_target);

        {
            player removeSimpleTask ([_x select 0] call FUNC(task,get));
        } forEach (_target getVariable QGVAR(tasks));
    }]] call FUNC(network,mp);

    {
        [_x select 0] call FUNC(task,delete);
    } forEach (_target getVariable QGVAR(tasks));
};

if !(isNil QMODULE(marker)) then {
    [
        format ["mission_main_%1", _target getVariable "name"]
    ] call FUNC(marker,delete);
    
    if !(isNil QMODULE(teleport)) then {
        [
            format ["teleport_%1", locationPosition ([position _target] call FUNC(common,nearestLocation))]
        ] call FUNC(marker,delete);
    };
};

GVAR(mission_main_targets) = GVAR(mission_main_targets) + [_target];

__log format ["Recycled %1", _target getVariable "name"]];