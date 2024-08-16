/**
 * Heap Module (Handler)
 */

#define THIS_MODULE heap
#include "x_macros.sqf"

if (hasInterface) then {
    if (str player in GVAR(medics)) exitWith {};

    [
        markerPos QGVAR(heap),
        markerDir QGVAR(heap)
    ] call FUNC(THIS_MODULE,create);
};