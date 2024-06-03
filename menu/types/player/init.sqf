/**
 * Menu - Player Module
 */

#define THIS_MODULE menu_player
#include "x_macros.sqf"

if (hasInterface) then {
    GVAR(menu_player_action) = [
        "",
        FUNCTION(menu,show),
        [],
        -3,
        false,
        true,
        "",
        "!([[_target] call d_fnc_menu_type, []] call BIS_fnc_areEqual) && {[_target] call d_fnc_menu_player_valid}"
    ];
};

__cppfln(FUNC(THIS_MODULE,action),menu\types\player\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,show),menu\types\player\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,valid),menu\types\player\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;