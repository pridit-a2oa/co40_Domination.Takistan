/**
 * Vehicle Module (Handler)
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (hasInterface) then {
    if (!isNil QUOTE(MODULE(marker))) then {
        [_vehicle] __submodule(marker);
    };
    
    if (!isNil QUOTE(MODULE(perk))) then {
        [_vehicle] __submodule(perk);
    };

    if (!isNil QUOTE(MODULE(vehicle_hud))) then {
        [_vehicle] __submodule(vehicle_hud);
    };
    
    if (!isNil QUOTE(MODULE(vehicle_protection))) then {
        [_vehicle] __submodule(vehicle_protection);
    };
};

if (isServer) then {
    if (!isNil QUOTE(MODULE(vehicle_respawn))) then {
        [_vehicle] __submodule(vehicle_respawn);
    };
};

MODULE(THIS_MODULE) = true;