/**
 * Base Ammobox Module
 */

#define THIS_MODULE base_ammobox
#include "x_macros.sqf"
private ["_box"];

if (!isNil QUOTE(MODULE(ammobox))) then {
    _box = [
        markerPos QGVAR(player_ammobox_pos),
        markerDir QGVAR(player_ammobox_pos)
    ] call FUNC(ammobox,create);

    _box setVariable ["immune", true];

    [_box] call FUNC(ammobox,replenish);
    [_box] execFSM FSM(ammobox,respawn);
    
    [_box] __module(ammobox);
};

MODULE(THIS_MODULE) = true;