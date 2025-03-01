#include "x_macros.sqf"

if !([] call FUNC(common,ready)) exitWith {false};
if !([speed player, 0] call BIS_fnc_areEqual) exitWith {false};

switch ([typeOf (unitBackpack player), "US_UAV_Pack_EP1"] call BIS_fnc_areEqual) do {
    case true: {
        call FUNC(client,sitting)
    };

    default {
        !isNil QMODULE(base_uav) && {triggerActivated GVAR(base_uav_trigger) && {!(call FUNC(client,sitting))}}
    };
};