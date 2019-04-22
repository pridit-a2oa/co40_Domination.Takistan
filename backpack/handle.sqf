/**
 * Backpack Module (Handler)
 */

#define THIS_MODULE backpack
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(perk)) then {
        __submodule(perk);
    };
};