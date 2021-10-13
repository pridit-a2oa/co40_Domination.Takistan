#define THIS_MODULE mission_mini
#include "x_macros.sqf"
private ["_trigger"];

PARAMS_1(_trigger);

if (!isNil QMODULE(intel)) then {
    gameLogic setVariable [QGVAR(intel), false, true];
};

if (!isNil QMODULE(marker)) then {
    [_trigger getVariable "marker"] call FUNC(marker,delete);
};

0 spawn FUNC(THIS_MODULE,cleanup);