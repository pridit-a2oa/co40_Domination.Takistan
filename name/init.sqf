/**
 * Name Module
 *
 * Description: Displays player names on the map dependant on their current
 * position.
 */

#define THIS_MODULE name
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,unconscious),THIS_MODULE\functions\fn_unconscious.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;