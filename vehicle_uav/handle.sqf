/**
 * Vehicle UAV Module (Handler)
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"

if (hasInterface) then {
    player addAction [
        "UAV Terminal" call FUNC(common,BlueText),
        FUNCTION(THIS_MODULE,show),
        [],
        10,
        false,
        true,
        "",
        "[player, _target] call BIS_fnc_areEqual && {call d_fnc_vehicle_uav_valid}"
    ];
};