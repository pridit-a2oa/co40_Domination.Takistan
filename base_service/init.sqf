/**
 * Base Service Module
 *
 * Description: This module provides designated areas in which players are able
 * to repair, refuel, & rearm the vehicle which they are driving or piloting.
 */

#define THIS_MODULE base_service
#include "x_macros.sqf"

// Time per individual servicing stage
GVAR(base_service_time_stage) = 3;

MODULE(THIS_MODULE) = true;