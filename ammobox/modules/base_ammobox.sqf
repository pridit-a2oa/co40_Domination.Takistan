/**
 * Ammobox Module - Base Ammobox Submodule
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_box"];

_box = [
    markerPos QGVAR(player_ammobox_pos),
    markerDir QGVAR(player_ammobox_pos),
    true
] call FUNC(THIS_MODULE,create);

_box setVariable [QGVAR(immune), true];

[_box] call FUNC(THIS_MODULE,replenish);
[_box] execFSM FSM(THIS_MODULE,respawn);