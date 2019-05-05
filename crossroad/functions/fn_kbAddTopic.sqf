#include "x_macros.sqf"
private ["_name", "_bikb"];

PARAMS_2(_name, _bikb);

if (hasInterface) then {
    player kbAddTopic [_name, _bikb];
};

GVAR(crossroad) kbAddTopic [_name, _bikb];
GVAR(crossroad2) kbAddTopic [_name, _bikb];