/**
 * Ammobox Module (Handler)
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_box"];
PARAMS_1(_box);

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

if (!isNil "_box") then {
    if (!isNil QMODULE(perk)) then {
        [_box] __submodule(perk);
    };
};

MODULE(THIS_MODULE) = true;