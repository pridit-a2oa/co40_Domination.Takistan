/**
 * Option Module (Handler)
 */

#define THIS_MODULE option
#include "x_macros.sqf"

if (hasInterface) then {
    player addAction ["Options" call FUNC(common,GreyText), __function(show), [], -9, false, true, "", "player == _target"];
};