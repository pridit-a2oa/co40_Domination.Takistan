#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_name", "_marker"];

PARAMS_1(_target);

_name = _target getVariable "name";

[_target] call FUNC(THIS_MODULE,remove);

[_target, "camp"] call FUNC(THIS_MODULE,type);
[_target, "radio"] call FUNC(THIS_MODULE,type);

if (!isNil QMODULE(ied)) then {
    [_target, 600] spawn FUNC(ied,create);
};

GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "NewTarget", ["1", {}, _name, ["pause", [_name] call FUNC(THIS_MODULE,name), "pause"]], true];

waitUntil {GVAR(crossroad) kbWasSaid [GVAR(crossroad2), "mission_main", "NewTarget", 5]};

[nil, nil, rPlaySound, QGVAR(sound_task)] call RE;
[nil, nil, rSpawn, [_target], {
    private ["_target", "_name", "_description"];

    PARAMS_1(_target);

    if (!isNil QMODULE(task)) then {
        _title = format ["Main Target: %1", _target getVariable "name"];
        _description = format ["Seize %1 from oppressive forces", _target getVariable "name"];

        _task = [
            _target getVariable "name",
            position _target,
            [_description, _title, _target getVariable "name"],
            "Created"
        ] call FUNC(task,create);
        
        [[_target getVariable "name"] call FUNC(task,get), "created"] call FUNC(task,hint);
        
        _target setVariable [QGVAR(tasks), (_target getVariable QGVAR(tasks)) + [_task], true];
    };

    if (!isNil QMODULE(marker)) then {
        [
            format ["mission_main_%1", _target getVariable "name"],
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
_trigger setTriggerArea [GVAR(mission_main_radius_zone), GVAR(mission_main_radius_zone), 0, false];
_trigger setTriggerActivation ["WEST", "PRESENT", true];
_trigger setTriggerStatements [
    "{isPlayer _x} count thisList > 0",
    "[thisTrigger getVariable ""d_target""] call d_fnc_mission_main_spotted; deleteVehicle thisTrigger",
    ""
];

waitUntil {[_target] call FUNC(THIS_MODULE,clear)};

[_target] call FUNC(THIS_MODULE,complete);