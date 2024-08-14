/**
 * Cleanup Module (Handler)
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

if (isServer) then {
    0 spawn FUNC(THIS_MODULE,crater);
    0 spawn FUNC(THIS_MODULE,group);

    __fsm(NotAliveRemover);
};