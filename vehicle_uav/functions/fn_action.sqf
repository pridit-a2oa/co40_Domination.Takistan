#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

disableSerialization;

if !(call FUNC(THIS_MODULE,valid)) exitWith {};
if !(ctrlEnabled (DIALOG("X_VEHICLE_UAV_DIALOG", 300))) exitWith {};

[call FUNC(THIS_MODULE,target), true] spawn FUNC(THIS_MODULE,control);

closeDialog 0;