#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if ([count GVAR(mission_main_targets_completed), GVAR(mission_main_targets_maximum)] call BIS_fnc_areEqual) then {
    GVAR(mission_main_targets_completed) = [GVAR(mission_main_targets_completed), 0] call FUNC(common,deleteAt);
};

GVAR(mission_main_targets_completed) = GVAR(mission_main_targets_completed) + [_target];

if (!isNil QMODULE(marker)) then {
    private ["_name"];

    _name = format ["mission_main_%1", _target getVariable "name"];
    
    [_name] call FUNC(marker,delete);
    
    [true, "spawn", [[_name, _target], {
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
    }]] call FUNC(network,mp);
};

if (!isNil QMODULE(task)) then {
    private ["_task"];

    _task = (_target getVariable QGVAR(tasks)) select 0;
    
    [_task, "Succeeded"] call FUNC(task,state);
    
    {
        if (_x select 3 == "Created") then {
            [_x, "Failed"] call FUNC(task,state);
        };
    } forEach (_target getVariable QGVAR(tasks));
    
    [true, "spawn", [[_target], {
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
    }]] call FUNC(network,mp);
};

if !(isNil QMODULE(conversation)) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Seized"],
        [
            ["1", {}, _target getVariable "name", []]
        ]
    ] call FUNC(conversation,radio);
};

if (!isNil QMODULE(teleport)) then {
    private ["_position", "_flag"];

    _position = [position _target, 20, GVAR(mission_main_radius_zone) / 3, 2, 0, 0.5, 0] call FUNC(common,safePos);

    _flag = [_position] call FUNC(teleport,create);
    
    _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + [_flag]];
    
    [true, "spawn", [[_target, _flag], {
        private ["_target", "_flag"];
        
        PARAMS_2(_target, _flag);
        
        [
            format ["teleport_%1", _target getVariable "name"],
            position _flag,
            "Town",
            " Fast Travel",
            "ColorYellow",
            0.8,
            "ICON",
            [0.6, 0.6]
        ] call FUNC(marker,create);
    }]] call FUNC(network,mp);
    
    [true, "execVM", [[_flag], __submoduleRE(teleport)]] call FUNC(network,mp);
};

[true, "spawn", [[], {
    playSound "fanfare";

    if (isNil QMODULE(setting) || {(player getVariable QGVAR(sounds) select 1 == 0)}) exitWith {};

    sleep 3;

    playSound QGVAR(sound_complete);
}]] call FUNC(network,mp);

_target spawn {
    sleep GVAR(mission_main_time_clear);

    if (!isNil QMODULE(ied)) then {
        {
            deleteVehicle _x;
        } forEach (_this getVariable QGVAR(ieds));
    };

    [_this] call FUNC(THIS_MODULE,kill);
    [_this] spawn FUNC(THIS_MODULE,recycle);
};

[_target] spawn {
    private ["_target", "_targets"];

    PARAMS_1(_target);

    sleep GVAR(mission_main_time_delay) / 2;

    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "StandBy"]
    ] call FUNC(conversation,radio);

    sleep GVAR(mission_main_time_delay) / 2;

    _targets = [];

    {
        private ["_location"];

        _location = _x;

        if (_target distance _x > GVAR(mission_main_distance_location) && {{_x distance _location < GVAR(mission_main_distance_player)} count (call FUNC(common,players)) < 1}) then {
            _targets = _targets + [_x];
        };
    } forEach (GVAR(mission_main_targets) - GVAR(mission_main_targets_completed));

    if (count _targets == 0) then {
        __log "Exhausted conditionable locations, cycling with completed excluded"];

        _targets = (GVAR(mission_main_targets) - GVAR(mission_main_targets_completed));
    };

    if (count _targets == 0) then {
        __log "Exhausted all conditionable locations, cycling without conditions"];

        _targets = GVAR(mission_main_targets);
    };

    if (count _targets == 0) exitWith {
        __log "Exhausted all locations, can't cycle"];
    };

    [_targets call BIS_fnc_selectRandom] spawn FUNC(THIS_MODULE,create);
};

__log format ["Seized %1", _target getVariable "name"]];