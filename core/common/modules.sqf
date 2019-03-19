/**
 * Core Module - Common (client & server)
 */

#include "x_macros.sqf"

__module(base_shield);
__module(vehicle);
__module(vehicle_ammobox);
__module(vehicle_mhq);
__module(vehicle_wreck);

0 spawn {
    __module(weather);
};