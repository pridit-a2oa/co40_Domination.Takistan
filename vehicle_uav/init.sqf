/**
 * Vehicle UAV Module
 *
 * Description: This module facilitates remote controlling of specific vehicle
 * types.
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

// Vehicle type that can be remote controlled
GVAR(vehicle_uav_type) = "MQ9PredatorB_US_EP1";

MODULE(THIS_MODULE) = true;