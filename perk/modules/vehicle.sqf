/**
 * Perk - Vehicle Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_vehicle addAction ["My Perks" call FUNC(common,GreyText), __function(show), [], -4, false, true, "", "player in _target"];

if (!isNil QMODULE(vehicle_bonus)) then {
    [_vehicle] __submodule(vehicle_bonus);
};

if (!isNil QMODULE(vehicle_flip)) then {
    [_vehicle] __submodule(vehicle_flip);
};