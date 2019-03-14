/**
 * Backpack Module
 */

#define THIS_MODULE backpack
#include "x_macros.sqf"
private ["_heap"];

__cppfln(FUNC(THIS_MODULE,list),THIS_MODULE\functions\fn_list.sqf);

_heap = "Misc_Backpackheap_EP1" createVehicleLocal (markerPos QGVAR(player_backpacks_pos));
_heap setDir (markerDir QGVAR(player_backpacks_pos));
_heap setPos (markerPos QGVAR(player_backpacks_pos));
player reveal _heap;

[_heap] call FUNC(THIS_MODULE,list);

MODULE(THIS_MODULE) = true;