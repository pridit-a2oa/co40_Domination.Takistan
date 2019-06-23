#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

_unit setVariable [QGVAR(unconscious), true, true];

moveOut _unit;

_unit setUnconscious true;
_unit spawn {
    sleep 0.1;
    
    _this switchMove "";
    _this playActionNow "Die";
    
    titleText ["", "BLACK", 0];
    
    sleep 1;
    
    titleText ["You are unconscious\n\n\nYou can wait to be revived or\nrespawn through the Escape menu", "BLACK FADED"];
    
    sleep 6;
    
    titleText ["", "BLACK IN", 3];
};

if (!isNil QMODULE(name)) then {
    [_unit] __submoduleVM(name);
};

[nil, nil, rSpawn, [_unit], {systemChat format ["%1 is unconscious", name (_this select 0)]}] call RE;