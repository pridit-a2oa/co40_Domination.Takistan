/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"

__module(ammobox);
__module(base_shield);
__module(vehicle);
__module(vehicle_ammobox);
__module(vehicle_bonus);
__module(vehicle_create);
__module(vehicle_mhq);
__module(vehicle_wreck);
__module(base_wreck);

0 spawn {
    __module(weather);
};