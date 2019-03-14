/**
 * Vehicle Module (Handler)
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"
PARAMS_1(_vehicle);

if (!isNil QUOTE(MODULE(perk))) then {
    [_vehicle] __submodule(perk);
};

if (!isNil QUOTE(MODULE(vehicle_hud))) then {
    [_vehicle] __submodule(vehicle_hud);
};

MODULE(THIS_MODULE) = true;