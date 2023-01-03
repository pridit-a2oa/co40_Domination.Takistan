/**
 * Communication Module
 *
 * Description: This module handles the management of the 'Communication'
 * context menu to provide players with additional options.
 */

#define THIS_MODULE communication
#include "x_macros.sqf"

if (hasInterface) then {
    BIS_MENU_GroupCommunication = [
        ["Options", false]
    ];
};

__cppfln(FUNC(THIS_MODULE,add),THIS_MODULE\functions\fn_add.sqf);
__cppfln(FUNC(THIS_MODULE,toggle),THIS_MODULE\functions\fn_toggle.sqf);

MODULE(THIS_MODULE) = true;