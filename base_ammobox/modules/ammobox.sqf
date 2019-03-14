/**
 * Base Ammobox - Ammobox Submodule
 */

#include "x_macros.sqf"
private ["_box"];

_box = "USVehicleBox_EP1" createVehicleLocal (markerPos QGVAR(player_ammobox_pos));
_box setDir (markerDir QGVAR(player_ammobox_pos));
_box setPos (markerPos QGVAR(player_ammobox_pos));
_box setVariable ["immune", true];
player reveal _box;

[_box] call FUNC(ammobox,replenish);
[_box] execFSM FSM(ammobox,respawn);