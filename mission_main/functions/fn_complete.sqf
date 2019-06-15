#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (!isNil QMODULE(marker)) then {
    _name = format ["mission_main_%1", _target getVariable "name"];
    
    [_name] call FUNC(marker,delete);
    
    _marker = ([
        format ["mission_main_%1", _target getVariable "name"],
        position _target,
        "",
        "",
        "ColorGreen",
        0.6,
        "ELLIPSE",
        [GVAR(mission_main_radius_zone), GVAR(mission_main_radius_zone)]
    ] call FUNC(marker,create));
};

if (!isNil QMODULE(task)) then {
    [nil, nil, rSpawn, [_target], {
        private ["_target"];
        
        PARAMS_1(_target);
        
        _task = _target getVariable QGVAR(task);
        _task setTaskState "Succeeded";
        
        [_task, "succeeded"] call FUNC(task,hint);
    }] call RE;
};

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Seized", ["1", {}, _target getVariable "name", []], true];

[nil, nil, rPlaySound, "fanfare"] call RE;

0 spawn {
    sleep 3;
    
    [nil, nil, rPlaySound, QGVAR(sound_complete)] call RE;
};

[_target] spawn FUNC(THIS_MODULE,recycle);

[GVAR(mission_main_targets) call BIS_fnc_selectRandom] spawn FUNC(THIS_MODULE,create);