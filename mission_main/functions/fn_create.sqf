#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_name", "_marker"];

PARAMS_1(_target);

_name = _target getVariable "name";

[_target] call FUNC(THIS_MODULE,reset);
[_target] call FUNC(THIS_MODULE,remove);

[_target, "camp"] call FUNC(THIS_MODULE,type);
[_target, "radio"] call FUNC(THIS_MODULE,type);
[_target, "composition"] call FUNC(THIS_MODULE,type);

if (!isNil QMODULE(ied)) then {
    [_target, 600] spawn FUNC(ied,create);
};

if (!isNil QMODULE(unit)) then {
    [_target] __submoduleVM(unit);
};

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "NewTarget", ["1", {}, _name, ["pause", [_name] call FUNC(THIS_MODULE,name), "pause"]], true];

waitUntil {sleep 0.1; GVAR(crossroad) kbWasSaid [GVAR(crossroad2), "mission_main", "NewTarget", 5]};

if (!isNil QMODULE(task)) then {
    _task = [
        _name,
        position _target,
        [
            format ["Seize %1 from oppressive forces", _name],
            format ["Main Target: %1", _name],
            _name
        ],
        "Created"
    ];

    _target setVariable [QGVAR(tasks), (_target getVariable QGVAR(tasks)) + [_task], true];
};

[nil, nil, rPlaySound, QGVAR(sound_task)] call RE;
[nil, nil, rSpawn, [_target], {
    private ["_target", "_name"];
    
    PARAMS_1(_target);
    
    _name = _target getVariable "name";
    
    if (!isNil QMODULE(task)) then {
        _task = (_target getVariable QGVAR(tasks)) select 0;
        _task call FUNC(task,create);
        
        [[_name] call FUNC(task,get), "created"] call FUNC(task,hint);
    };
    
    if (!isNil QMODULE(marker)) then {
        [
            format ["mission_main_%1", _name],
            position _target,
            "",
            "",
            "ColorRed",
            0.8,
            "ELLIPSE",
            [GVAR(mission_main_radius_zone), GVAR(mission_main_radius_zone)]
        ] call FUNC(marker,create);
    };
}] call RE;

for "_i" from 1 to GVAR(mission_main_amount_optional) do {
    sleep 2;
    
    [_target, "optional"] spawn FUNC(THIS_MODULE,type);
};

_trigger = createTrigger ["EmptyDetector", position _target];
_trigger setVariable [QGVAR(target), _target];
_trigger setTriggerArea [GVAR(mission_main_radius_zone) + 300, GVAR(mission_main_radius_zone) + 300, 0, false];
_trigger setTriggerActivation ["WEST", "EAST D", true];
_trigger setTriggerStatements [
    "{isPlayer _x} count thisList > 0 && {!((thisTrigger getVariable ""d_target"") getVariable 'd_detected')}",
    "[thisTrigger getVariable ""d_target""] call d_fnc_mission_main_detected",
    ""
];

__log format ["Seeded %1", _name]];

waitUntil {sleep 5; [_target] call FUNC(THIS_MODULE,clear)};

deleteVehicle _trigger;

sleep 15;

[_target] call FUNC(THIS_MODULE,complete);