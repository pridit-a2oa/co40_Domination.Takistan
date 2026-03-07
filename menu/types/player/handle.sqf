/**
 * Menu - Player Module (Handler)
 */

#define THIS_MODULE menu_player
#include "x_macros.sqf"

if (hasInterface) then {
    [] call FUNC(THIS_MODULE,handle);
};