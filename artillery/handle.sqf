/**
 * Artillery Module (Handler)
 */

#define THIS_MODULE artillery
#include "x_macros.sqf"

"artillery" addPublicVariableEventHandler {
    (_this select 1) spawn FUNC(THIS_MODULE,call);
};