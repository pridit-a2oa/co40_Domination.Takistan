/**
 * Air Taxi Module (Handler)
 */

#define THIS_MODULE airtaxi
#include "x_macros.sqf"

"airTaxi" addPublicVariableEventHandler {
    (_this select 1) spawn FUNC(THIS_MODULE,call);
};