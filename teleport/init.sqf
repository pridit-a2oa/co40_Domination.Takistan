/**
 * Teleport Module (Handler)
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,switch),THIS_MODULE\functions\fn_switch.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);

MODULE(THIS_MODULE) = true;