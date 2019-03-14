/**
 * Vehicle HUD - Vehicle Submodule
 */

#define THIS_MODULE vehicle_hud
#include "x_macros.sqf"
PARAMS_1(_vehicle);

if (!isNil QUOTE(MODULE(vehicle_ammobox))) then {
    [_vehicle] __submodule(vehicle_ammobox);
};

if (!isNil QUOTE(MODULE(vehicle_lift))) then {
    [_vehicle] __submodule(vehicle_lift);
};

if (!isNil QUOTE(MODULE(vehicle_wreck))) then {
    [_vehicle] __submodule(vehicle_wreck);
};