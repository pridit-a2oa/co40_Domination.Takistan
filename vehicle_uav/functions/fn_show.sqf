#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

createDialog "XD_VehicleUavDialog";

[DIALOG("X_VEHICLE_UAV_DIALOG", 10000)] call FUNC(client,cursorMap);

0 spawn FUNC(THIS_MODULE,populate);