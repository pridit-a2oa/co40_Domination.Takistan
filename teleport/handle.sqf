/**
 * Teleport Module (Handler)
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"

if (hasInterface) then {
    {
        _x addAction [
            "Fast Travel" call FUNC(common,YellowText),
            __function(show),
            [],
            2,
            false,
            true,
            "",
            "!isNil {_target getVariable ""d_teleport""} && {[player, vehicle player] call BIS_fnc_areEqual}"
        ];
    } forEach (allMissionObjects GVAR(teleport_type_object));

    [
        "teleport_[8622.05,2454.22,-315.322]",
        position GVAR(flag),
        "Town",
        " Fast Travel",
        "ColorBlue",
        0.8,
        "ICON",
        "",
        [0.6, 0.6]
    ] call FUNC(marker,create);
};

if (isServer) then {
    GVAR(flag) setVariable [QGVAR(teleport), true, true];
};