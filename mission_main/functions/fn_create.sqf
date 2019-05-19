#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_name", "_marker"];

PARAMS_1(_target);

_name = _target getVariable "name";

[_target, "camp"] call FUNC(THIS_MODULE,type);
[_target, "radio"] call FUNC(THIS_MODULE,type);

if (!isNil QMODULE(ied)) then {
    [_target, 600] call FUNC(ied,create);
};

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "NewTarget", ["1", {}, _name, ["pause", [_name] call FUNC(THIS_MODULE,name)]], true];

sleep 2;

[nil, nil, rPlaySound, QGVAR(sound_task)] call RE;
[nil, nil, rSpawn, [_target], {
    private ["_target", "_name", "_description"];
    
    PARAMS_1(_target);
    
    if (!isNil QMODULE(task)) then {
        _name = format ["Main Target: %1", _target getVariable "name"];
        _description = format ["Seize %1 from oppressive forces", _target getVariable "name"];
    
        _task = [_target getVariable "name", [(position _target) select 0, (position _target) select 1, 0], [_description, _name, _target getVariable "name"], "Created"] call FUNC(task,create);
        [_task, "created"] call FUNC(task,hint);
    };
    
    if (!isNil QMODULE(marker)) then {
        [
            format ["mission_%1", _target getVariable "name"],
            position _target,
            "",
            "",
            "ColorRed",
            "ELLIPSE",
            [400, 400]
        ] call FUNC(marker,create);
    };
}] call RE;