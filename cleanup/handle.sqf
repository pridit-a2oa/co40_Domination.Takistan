/**
 * Cleanup Module (Handler)
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

if (isServer) then {
    0 spawn FUNC(THIS_MODULE,bomb);
    0 spawn FUNC(THIS_MODULE,crater);
    
    __fsm(NotAliveRemover);
};