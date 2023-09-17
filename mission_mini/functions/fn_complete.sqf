#define THIS_MODULE mission_mini
#include "x_macros.sqf"
private ["_trigger"];

PARAMS_1(_trigger);

if !(isNil QMODULE(marker)) then {
    [_trigger getVariable "marker"] call FUNC(marker,delete);
};

if !(isNil QMODULE(vehicle_bomber)) then {
    gameLogic setVariable [QGVAR(bomber), false, true];
};

[
    position _trigger,
    GVAR(mission_mini_distance_cleanup),
    GVAR(mission_mini_time_cleanup),
    _trigger getVariable "entities"
] spawn FUNC(server,cleanup);

deleteVehicle _trigger;