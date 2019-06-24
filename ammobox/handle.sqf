/**
 * Ammobox Module (Handler)
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_box"];

PARAMS_1(_box);

if (hasInterface) then {
    if (!isNil QMODULE(perk)) then {
        [_box] __submoduleVM(perk);
    };
};