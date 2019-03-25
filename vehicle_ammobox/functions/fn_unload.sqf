#define THIS_MODULE vehicle_ammobox
#include "x_macros.sqf"
private ["_vehicle", "_position", "_box"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

_position = _vehicle modelToWorld [4,0,0];

_box = [
    [_position select 0, _position select 1, 0],
    direction _vehicle,
    false
] call FUNC(ammobox,create);

[_box] call FUNC(vehicle_ammobox,replenish);

[nil, nil, rEXECVM, __moduleRE(ammobox), _box] call RE;

[nil, _box, rSAY, QGVAR(sound_box), 20] call RE;

_vehicle setVariable [QGVAR(ammobox), false, true];

closeDialog 0;
call FUNC(vehicle_menu,show);