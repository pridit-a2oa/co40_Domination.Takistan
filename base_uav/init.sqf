/**
 * Base UAV Module
 *
 * Description: This module facilitates the creation of a UAV area w/ vehicle
 * spawn.
 */

#define THIS_MODULE base_uav
#include "x_macros.sqf"

// Composition of the UAV point
GVAR(base_uav_type_composition) = "HeliParking1_US_EP1";

// Vehicle that spawns
GVAR(base_uav_type_vehicle) = "MQ9PredatorB_US_EP1";

if (isServer) then {
    X_JIPH setVariable [QGVAR(base_uav), false, true];
};

__cppfln(FUNC(THIS_MODULE,offset),THIS_MODULE\functions\fn_offset.sqf);

MODULE(THIS_MODULE) = true;