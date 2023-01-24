/**
 * Bomber Module (Handler)
 */

#define THIS_MODULE bomber
#include "x_macros.sqf"

if (isServer) then {
    GVAR(bomber_type_roads) = [];

    {
        if ((position _x) distance (markerPos QGVAR(bomber)) > (GVAR(bomber_distance_spawn) - 10)) then {
            GVAR(bomber_type_roads) = GVAR(bomber_type_roads) + [_x]
        };
    } forEach ((markerPos QGVAR(bomber)) nearRoads GVAR(bomber_distance_spawn));

    __fsm(civilian);
};