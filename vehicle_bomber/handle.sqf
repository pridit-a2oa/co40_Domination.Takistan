/**
 * Vehicle Bomber Module (Handler)
 */

#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"

if (isServer) then {
    GVAR(vehicle_bomber_type_roads) = [];

    {
        if ((position _x) distance (markerPos QGVAR(bomber)) > (GVAR(vehicle_bomber_distance_spawn) - 10)) then {
            GVAR(vehicle_bomber_type_roads) = GVAR(vehicle_bomber_type_roads) + [_x]
        };
    } forEach ((markerPos QGVAR(bomber)) nearRoads GVAR(vehicle_bomber_distance_spawn));

    __fsm(civilian);
};