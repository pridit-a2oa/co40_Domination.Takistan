/**
 * Heap Module (Handler)
 */

#define THIS_MODULE heap
#include "x_macros.sqf"

if (hasInterface) then {
    if !([GVAR(medics) find (str player), -1] call BIS_fnc_areEqual) exitWith {};
    
    [
        markerPos QGVAR(heap),
        markerDir QGVAR(heap)
    ] call FUNC(THIS_MODULE,create);
};