/**
 * Ammobox Module
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_box"];

__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

if (!isNil QUOTE(MODULE(base_ammobox))) then {
    __submodule(base_ammobox);
};

MODULE(THIS_MODULE) = true;