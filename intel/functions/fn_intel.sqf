#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_car"];

PARAMS_1(_car);

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
};

_car setVariable [QGVAR(intel), false, true];

if (GVAR(intel_chance_bomb) > random 100) exitWith {
    [_car] spawn FUNC(THIS_MODULE,explode);
};

[_car] spawn FUNC(THIS_MODULE,target);