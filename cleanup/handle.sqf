/**
 * Cleanup Module (Handler)
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

if (isServer) then {
    __fsm(NotAliveRemover);
};