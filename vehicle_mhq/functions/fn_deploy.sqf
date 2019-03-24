#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_position = position _vehicle;

_camo = createVehicle ["Land_CamoNetB_NATO_EP1", [_position select 0, _position select 1, 0], [], 0, "NONE"];
_camo setDir direction _vehicle;
_camo setVectorUp (vectorUp _vehicle);
_camo setPos [_position select 0, _position select 1, 0];
_camo addEventHandler ["handleDamage", {0}];

_vehicle setVehicleLock "LOCKED";
_vehicle setVariable [QGVAR(camo), _camo];
_vehicle setVariable [QGVAR(deployed), true];

closeDialog 0;
call FUNC(vehicle_menu,show);