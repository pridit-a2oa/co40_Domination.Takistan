/**
 * Item Module (Handler)
 */

#define THIS_MODULE item
#include "x_macros.sqf"

if !(hasInterface) exitWith {};

{
    _x call FUNC(THIS_MODULE,model);
} forEach (X_JIP getVariable QGVAR(item_objects));