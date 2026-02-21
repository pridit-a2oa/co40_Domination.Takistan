/**
 * Menu Module - Accolade Submodule
 */

#define THIS_MODULE menu
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

_unit addAction [
    format [
        "[%1] %2",
        "Menu" call FUNC(common,KhakiText),
        [typeOf _unit] call FUNC(vehicle,name)
    ] call FUNC(common,GreyText),
    __function(show),
    [],
    -3,
    false,
    true,
    "",
    "!([[_target] call d_fnc_menu_type, []] call BIS_fnc_areEqual) && {[_target] call d_fnc_menu_unit_valid}"
];