/**
 * Menu - Unit Module
 */

#define THIS_MODULE menu_unit
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,action),menu\types\unit\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,show),menu\types\unit\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,valid),menu\types\unit\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;