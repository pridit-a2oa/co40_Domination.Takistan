#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_car"];

PARAMS_1(_car);

_car setVariable [QGVAR(intel), false, true];

if (GVAR(intel_chance_bomb) > random 100) exitWith {
    [_car] spawn FUNC(THIS_MODULE,explode);
    
    GVAR(intel) = false;
};

[_car] spawn FUNC(THIS_MODULE,target);

GVAR(intel) = false;