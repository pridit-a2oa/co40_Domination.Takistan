/**
 * Base Wreck Module (Handler)
 */

#define THIS_MODULE base_wreck
#include "x_macros.sqf"

if (!isNil QMODULE(vehicle_wreck)) then {
    __submoduleVM(vehicle_wreck);
};