/**
 * Vehicle Loadout Module - Vehicle Service Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

[_vehicle] call FUNC(THIS_MODULE,clear);
[_vehicle, true] call FUNC(THIS_MODULE,rearm);
[_vehicle] call FUNC(THIS_MODULE,arm);