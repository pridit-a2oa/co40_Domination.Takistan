/**
 * Intel Module (Handler)
 */

#define THIS_MODULE intel
#include "x_macros.sqf"

"intel" addPublicVariableEventHandler {
    (_this select 1) spawn FUNC(THIS_MODULE,intel);
};

if (isServer) then {
    GVAR(intel_type_roads) = [];

    {
        if ((position _x) distance (markerPos QGVAR(intel)) > (GVAR(intel_distance_spawn) - 10)) then {
            GVAR(intel_type_roads) = GVAR(intel_type_roads) + [_x]
        };
    } forEach ((markerPos QGVAR(intel)) nearRoads GVAR(intel_distance_spawn));
    
    __fsm(civilian);
};