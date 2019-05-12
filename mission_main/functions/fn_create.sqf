#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_name", "_marker"];

PARAMS_1(_target);

_name = text (_target);

[_target, "camp"] call FUNC(THIS_MODULE,type);
[_target, "radio"] call FUNC(THIS_MODULE,type);

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "NewTarget", ["1", {}, _name, ["pause", [_name] call FUNC(THIS_MODULE,name)]], true];

sleep 1.5;

[nil, nil, rPlaySound, QGVAR(sound_task)] call RE;
[nil, nil, rSpawn, [_target], {
    private ["_target", "_name", "_description"];
    
    PARAMS_1(_target);
    
    if (!isNil QMODULE(task)) then {
        _name = format ["Main Target: %1", text (_target)];
        _description = format ["Seize %1 from oppressive forces", text (_target)];
    
        _task = [text (_target), [(position _target) select 0, (position _target) select 1, 0], [_description, _name, text (_target)], "Created"] call FUNC(task,create);
        [_task, "created"] call FUNC(task,hint);
    };
    
    if (!isNil QMODULE(marker)) then {
        [
            format ["mission_%1", text (_target)],
            position _target,
            "",
            "",
            "ColorRed",
            "ELLIPSE",
            [400, 400]
        ] call FUNC(marker,create);
    };
}] call RE;