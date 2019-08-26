#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

{
    if (side _x == east) then {
        if (_x isKindOf "AllVehicles") then {
            {_x setDamage 1} forEach crew _x;
        } else {
            _x setDamage 1;
        };
    };
} forEach (_target nearEntities [["Man", "StaticWeapon"], GVAR(mission_main_radius_zone)]);

if (!isNil QMODULE(ied)) then {
    {
         deleteVehicle _x;
    } forEach (_target getVariable QGVAR(ieds));
};

if (!isNil QMODULE(marker)) then {
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

if (!isNil QMODULE(crossroad)) then {
    GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Seized", ["1", {}, _target getVariable "name", []], true];
};

if (!isNil QMODULE(teleport)) then {
    _position = [position _target, 20, GVAR(mission_main_radius_zone) / 3, 2, 0, 0.5, 0] call FUNC(common,safePos);

    _flag = createVehicle ["FlagCarrierUSA_EP1", _position, [], 0, "NONE"];
    
    [true, "spawn", [[_target, _flag], {
        private ["_target", "_flag"];
        
        PARAMS_2(_target, _flag);
        
        [
            format ["teleport_%1", _target getVariable "name"],
            position _flag,
            "Town",
            " Teleport",
            "ColorYellow",
            0.8,
            "ICON",
            [0.6, 0.6]
        ] call FUNC(marker,create);
    }]] call FUNC(network,mp);
    
    [true, "execVM", [_flag, __submoduleRE(teleport)]] call FUNC(network,mp);
};

[true, "spawn", [[], {
    playSound "fanfare";
    
    sleep 3;
    
    playSound QGVAR(sound_complete);
}]] call FUNC(network,mp);

[_target] spawn FUNC(THIS_MODULE,recycle);

[GVAR(mission_main_targets) call BIS_fnc_selectRandom] spawn FUNC(THIS_MODULE,create);

__log format ["Seized %1", _target getVariable "name"]];