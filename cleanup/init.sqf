/**
 * Cleanup Module
 *
 * Description: This module handles periodic removal of dead & wreck units.
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,bomb),THIS_MODULE\functions\fn_bomb.sqf);
__cppfln(FUNC(THIS_MODULE,crater),THIS_MODULE\functions\fn_crater.sqf);

MODULE(THIS_MODULE) = true;