#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (!isNil QMODULE(marker)) then {
    _name = format ["mission_main_%1", _target getVariable "name"];
    
    [_name] call FUNC(marker,delete);
    
    [nil, nil, rSpawn, [_name, _target], {
        private ["_name", "_target"];
        
        PARAMS_2(_name, _target);
        
        [
            _name,
            position _target,
            "",
            "",
            "ColorGreen",
            0.6,
            "ELLIPSE",
            [GVAR(mission_main_radius_zone), GVAR(mission_main_radius_zone)]
        ] call FUNC(marker,create);
    }] call RE;
};

if (!isNil QMODULE(task)) then {
    _task = (_target getVariable QGVAR(tasks)) select 0;
    
    [_task, "Succeeded"] call FUNC(task,state);
    
    {
        if (_x select 3 == "Created") then {
            [_x, "Failed"] call FUNC(task,state);
        };
    } forEach (_target getVariable QGVAR(tasks));
    
    [nil, nil, rSpawn, [_target], {
        private ["_target", "_task"];
        
        PARAMS_1(_target);
        
        if (!hasInterface) exitWith {};
        
        _task = [((_target getVariable QGVAR(tasks)) select 0) select 0] call FUNC(task,get);
        _task setTaskState "Succeeded";
        
        [_task, "succeeded"] call FUNC(task,hint);
        
        {
            if (_x select 3 == "Failed") then {
                _task = [_x select 0] call FUNC(task,get);
                _task setTaskState "Failed";
            };
        } forEach (X_JIPH getVariable QGVAR(tasks));
    }] call RE;
};

if (!isNil QMODULE(crossroad)) then {
    GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Seized", ["1", {}, _target getVariable "name", []], true];
};

if (!isNil QMODULE(teleport)) then {
    _position = [position _target, 20, GVAR(mission_main_radius_zone) / 3, 2, 0, 0.5, 0] call FUNC(common,safePos);

    _flag = createVehicle ["FlagCarrierUSA_EP1", _position, [], 0, "NONE"];

    [nil, nil, rSpawn, [_target, _flag], {
        private ["_target", "_flag"];
        
        PARAMS_2(_target, _flag);
        
        [
            format ["teleport_%1", _target getVariable "name"],
            position _flag,
            "Flag1",
            " Teleport",
            "ColorYellow",
            0.8,
            "ICON",
            [0.5, 0.5]
        ] call FUNC(marker,create);
    }] call RE;
    
    [nil, nil, "per", rExecVM, __submoduleRE(teleport), _flag] call RE;
};

[nil, nil, rSpawn, [], {
    playSound "fanfare";
    
    sleep 3;
    
    playSound QGVAR(sound_complete);
}] call RE;

[_target] spawn FUNC(THIS_MODULE,recycle);

0 spawn {
    sleep 30;
    
    [GVAR(mission_main_targets) call BIS_fnc_selectRandom] spawn FUNC(THIS_MODULE,create);
};