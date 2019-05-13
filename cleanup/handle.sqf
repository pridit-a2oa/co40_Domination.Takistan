/**
 * Cleanup Module (Handler)
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

if (isServer) then {
    0 spawn FUNC(cleanup,bomb);
    0 spawn FUNC(cleanup,crater);
    
    // __fsm(NotAliveRemover);
};