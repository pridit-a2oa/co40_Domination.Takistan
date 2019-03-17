/**
 * Marker Module - Vehicle Submodule
 */

#define THIS_MODULE marker
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (!isNil QUOTE(MODULE(vehicle))) then {
    [_vehicle] __submodule(vehicle);
};

if (!isNil QUOTE(MODULE(vehicle_mhq))) then {
    [_vehicle] __submodule(vehicle_mhq);
};