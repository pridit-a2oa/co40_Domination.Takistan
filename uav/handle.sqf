/**
 * UAV Module (Handler)
 */

#define THIS_MODULE uav
#include "x_macros.sqf"

"uav" addPublicVariableEventHandler {
    (_this select 1) spawn FUNC(THIS_MODULE,call);
};