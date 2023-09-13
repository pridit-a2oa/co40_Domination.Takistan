#include "x_macros.sqf"
private ["_object", "_amount", "_cooldown"];

_object = _this select 0;
_amount = (_this select 3) select 0;
_cooldown = (_this select 3) select 1;

_object setVariable [QGVAR(deconstructing), true];

if !([] call FUNC(client,stall)) exitWith {
    _object setVariable [QGVAR(deconstructing), false];
};

deleteVehicle _object;

player setVariable [format [QUOTE(%1), _amount], (player getVariable (format [QUOTE(%1), _amount])) + 1];
player setVariable [format [QUOTE(%1), _cooldown], time];