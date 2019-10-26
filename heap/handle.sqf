/**
 * Heap Module (Handler)
 */

#define THIS_MODULE heap
#include "x_macros.sqf"
private ["_heap"];

if (hasInterface) then {
    _heap = "Misc_Backpackheap_EP1" createVehicleLocal (markerPos QGVAR(heap));
    _heap setDir (markerDir QGVAR(heap));
    _heap setPos (markerPos QGVAR(heap));
    _heap addAction ["Drop" call FUNC(common,RedText), __function(drop), [], 10, false, true, "", "!isNull unitBackpack player"];

    player reveal _heap;

    [_heap] call FUNC(THIS_MODULE,list);
};