/**
 * Airdrop Module (Handler)
 */

#define THIS_MODULE airdrop
#include "x_macros.sqf"

"airdrop" addPublicVariableEventHandler {
    (_this select 1) spawn FUNC(THIS_MODULE,call);
};