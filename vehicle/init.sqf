/**
 * Vehicle Module (Handler)
 *
 * Description: Vehicle handling, which should apply to every vehicle
 * that is spawned. This provides core functionality which enhances
 * vehicles.
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,unlock),THIS_MODULE\functions\fn_unlock.sqf);

MODULE(THIS_MODULE) = true;