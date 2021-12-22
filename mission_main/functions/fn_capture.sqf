#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_flag", "_trigger", "_target"];

PARAMS_2(_flag, _trigger);

_target = _flag getVariable QGVAR(target);

if (!isNil QMODULE(crossroad) && {({alive _x} count (_target getVariable QGVAR(camps))) - 1 == 0}) then {
    GVAR(crossroad) kbTell [GVAR(crossroad2), "mission_main", "Captured", ["1", {}, _target getVariable "name", []], true];
};

if (!isNil QMODULE(marker)) then {
    private ["_name"];
    
    _name = format ["camp_%1", _flag getVariable QGVAR(id)];
    
    [_name] call FUNC(marker,delete);
};

_target setVariable [
    QGVAR(cleanup),
    (_target getVariable QGVAR(cleanup)) + [
        createVehicle ["FlagCarrierUSA_EP1", position _flag, [], 0, "CAN_COLLIDE"]
    ]
];

deleteVehicle _flag;

[true, "playSound", QGVAR(sound_capture)] call FUNC(network,mp);

if !(isNil "_trigger") then {
    deleteVehicle _trigger;
};