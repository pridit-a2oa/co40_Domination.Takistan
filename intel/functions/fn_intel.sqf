#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_car"];

PARAMS_1(_car);

if (!isServer) exitWith {
    intel = _this;
    publicVariableServer "intel";
};

_car setVariable [QGVAR(intel), false, true];

if (GVAR(intel_chance_bomb) > random 100) exitWith {
    [_car] spawn FUNC(THIS_MODULE,explode);

    X_JIPH setVariable [QGVAR(intel), false, true];
};

[_car] spawn FUNC(THIS_MODULE,target);