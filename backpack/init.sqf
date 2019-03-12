/**
 * Backpack Module
 */

#define THIS_MODULE backpack
#include "x_macros.sqf"
private ["_heap"];

_heap = "Misc_Backpackheap_EP1" createVehicleLocal (markerPos QGVAR(player_backpacks_pos));
_heap setDir (markerDir QGVAR(player_backpacks_pos));
_heap setPos (markerPos QGVAR(player_backpacks_pos));
player reveal _heap;

[_heap] call compile preprocessFileLineNumbers __function(list);