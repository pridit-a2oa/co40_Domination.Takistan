/**
 * Perk Module (Handler)
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

if (hasInterface) then {
    player addAction [
        "My Perks" call FUNC(common,GreyText),
        __function(show),
        [],
        -8,
        false,
        true,
        "",
        "[player, _target] call BIS_fnc_areEqual && {(position player) select 2 < 1}"
    ];
};