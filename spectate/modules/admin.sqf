/**
 * Spectate Module - Admin Submodule
 */

#include "x_macros.sqf"

if (!isNil QMODULE(communication)) then {
    BIS_MENU_Admin = BIS_MENU_Admin + [
        ["Spectate", [(count BIS_MENU_Admin) + 1], "", -5, [["expression", "[player, objNull, 'x'] execVM 'spectate\functions\fn_init.sqf'"]], "1", "1"]
    ];
};