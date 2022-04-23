#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_flag", "_trigger", "_units", "_target"];

PARAMS_3(_flag, _trigger, _units);

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

{
    if (isPlayer _x && {alive _x} && {!(_x isKindOf "Air")} && {!(_x getVariable QGVAR(unconscious))}) then {
        _x addScore GVAR(mission_main_amount_camps_score);
            
        [_x, "systemChat", format [
            "You have been given %1 score for capturing a camp",
            GVAR(mission_main_amount_camps_score)
        ]] call FUNC(network,mp);
    };
} forEach _units;