#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"
private ["_vehicle", "_position", "_box"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

_position = _vehicle modelToWorld [4,0,0];

_box = [
    [_position select 0, _position select 1, 0],
    direction _vehicle
] call FUNC(ammobox,create);

[_box] call FUNC(ammobox,replenish);
[_box] __module(ammobox);

_vehicle setVariable [QGVAR(ammobox), false];

closeDialog 0;
call FUNC(vehicle_menu,show);