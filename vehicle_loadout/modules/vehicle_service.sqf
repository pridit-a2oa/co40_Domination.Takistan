/**
 * Vehicle Loadout Module - Vehicle Service Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

[_vehicle] call FUNC(THIS_MODULE,clear);

sleep 1;

[_vehicle, true] call FUNC(THIS_MODULE,addMagazines);

sleep 1;

[_vehicle] call FUNC(THIS_MODULE,addWeapons);