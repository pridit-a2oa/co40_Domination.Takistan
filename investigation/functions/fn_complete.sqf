#define THIS_MODULE investigation
#include "x_macros.sqf"
private ["_trigger"];

PARAMS_1(_trigger);

if !(isNil QMODULE(marker)) then {
    [_trigger getVariable "marker"] call FUNC(marker,delete);
    [format ["%1_radius", _trigger getVariable "marker"]] call FUNC(marker,delete);
};

if !(isNil QMODULE(vehicle_bomber)) then {
    gameLogic setVariable [QGVAR(bomber), false, true];
};

[
    position _trigger,
    GVAR(investigation_distance_cleanup),
    GVAR(investigation_time_cleanup),
    _trigger getVariable "entities"
] spawn FUNC(server,cleanup);

deleteVehicle _trigger;