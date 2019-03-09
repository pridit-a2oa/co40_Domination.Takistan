/**
 * Cleanup Module
 */

#define THIS_MODULE cleanup
#include "x_macros.sqf"

execFSM "cleanup\fsm\NotAliveRemover.fsm";