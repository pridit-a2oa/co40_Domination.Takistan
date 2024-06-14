/**
 * Base Ammobox Module (Handle)
 */

#define THIS_MODULE base_ammobox
#include "x_macros.sqf"

if (hasInterface) then {
    if !(isNil QMODULE(ammobox)) then {
        __submodulePP(ammobox);
    };
};