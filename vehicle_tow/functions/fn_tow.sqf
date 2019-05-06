#define THIS_MODULE vehicle_tow
#include "x_macros.sqf"
private ["_tower", "_tow", "_towing"];

PARAMS_1(_tower);

_tow = _this select 3;

_tow setVariable [QGVAR(is_towed), true, true];
_tower setVariable [QGVAR(is_towing), true, true];

_detach = _tower addAction ["Detach" call FUNC(common,RedText), __function(detach), _tow, 10, true, true, "", ""];

while {_tow getVariable QGVAR(is_towed)} do {
    [_tower, GVAR(vehicle_amount_speed)] execVM FUNCTION(vehicle,speed);
};

_tower removeAction _detach;