/**
 * Vehicle Flip Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(player getVariable QGVAR(flip)) exitWith {false};
if (player in _vehicle) exitWith {false};
if !((vectorUp _vehicle) select 2 < 0.6) exitWith {false};

[
    format [
        "%1Unflip",
        if !(isNil QMODULE(perk)) then {"Perk: "} else {""}
    ],
    "flip"
] call FUNC(vehicle_menu,populate);

true