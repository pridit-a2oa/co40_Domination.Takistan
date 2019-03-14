/**
 * Ammobox Module
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_box"];

__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

if (!isNil QUOTE(MODULE(client,base_ammobox))) then {
    _box = __submodule(base_ammobox);
    player reveal _box;
    [_box] call FUNC(ammobox,replenish);
};

MODULE(client,THIS_MODULE) = true;