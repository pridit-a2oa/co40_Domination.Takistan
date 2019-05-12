#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (!isNil QMODULE(marker)) then {
    _name = format ["mission_main_%1", text (_target)];
    
    [_name] call FUNC(marker,delete);
    
    _marker = ([
        format ["mission_main_%1", text (_target)],
        position _target,
        "",
        "",
        "ColorGreen",
        "ELLIPSE",
        [400, 400]
    ] call FUNC(marker,create));
};

if (!isNil QMODULE(task)) then {
    [nil, nil, rSpawn, [_target], {[_this select 0, "succeeded"] call FUNC(task,hint)}] call RE;
};