/**
 * Ammobox Module - Base Ammobox Submodule
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_ammobox"];

_ammobox = [
    markerPos QGVAR(player_ammobox_pos),
    markerDir QGVAR(player_ammobox_pos),
    true
] call FUNC(THIS_MODULE,create);

_ammobox setVariable [QGVAR(immune), true];

[_ammobox] execFSM FSM(THIS_MODULE,respawn);