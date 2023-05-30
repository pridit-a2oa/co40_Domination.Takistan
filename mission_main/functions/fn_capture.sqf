#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_flag", "_trigger", "_units", "_target"];

PARAMS_3(_flag, _trigger, _units);

_target = _flag getVariable QGVAR(target);

if (!isNil QMODULE(conversation) && {({alive _x} count (_target getVariable QGVAR(camps))) - 1 == 0}) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Captured"],
        [
            ["1", {}, _target getVariable "name", []]
        ]
    ] call FUNC(conversation,radio);
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

if !(isNil "_trigger") then {
    deleteVehicle _trigger;
};

{
    if (!isNil QMODULE(reward) && {isPlayer _x && {[_x] call FUNC(client,ready)}}) then {
        [
            _x,
            GVAR(mission_main_amount_camps_score),
            "capturing a camp"
        ] call FUNC(reward,score);
    };
} forEach _units;