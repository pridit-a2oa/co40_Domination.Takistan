/**
 * Heap Module (Handler)
 */

#define THIS_MODULE heap
#include "x_macros.sqf"

[
    markerPos QGVAR(heap),
    markerDir QGVAR(heap)
] call FUNC(THIS_MODULE,create);