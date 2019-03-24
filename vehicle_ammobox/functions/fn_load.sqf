#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

if (_vehicle getVariable QGVAR(immune)) exitWith {};

_nearest = nearestObjects [_vehicle, ["USVehicleBox_EP1"], 15];

if (count _nearest == 0) exitWith {};

deleteVehicle (_nearest select 0);

_vehicle setVariable [QGVAR(ammobox), true];

closeDialog 0;
call FUNC(vehicle_menu,show);