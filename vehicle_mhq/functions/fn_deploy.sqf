#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_position = position _vehicle;

_camo = createVehicle ["Land_CamoNetB_NATO_EP1", [_position select 0, _position select 1, 0], [], 0, "NONE"];
_camo setDir direction _vehicle;
_camo setVectorUp (vectorUp _vehicle);
_camo setPos [_position select 0, _position select 1, 0];
_camo addEventHandler ["HandleDamage", {0}];

_vehicle lock true;
_vehicle setVariable [QGVAR(camo), _camo, true];
_vehicle setVariable [QGVAR(deployed), true, true];

if (!isNil QMODULE(marker)) then {
    [_vehicle, true] __submodule(marker);
};