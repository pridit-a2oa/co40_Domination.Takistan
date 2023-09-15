/**
 * Inventory Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_string"];

PARAMS_1(_vehicle);

_string = "";

{
    if (_vehicle in (_x select 2)) exitWith {
        _string = format ["<br />Replenish %1(s)", toLower (_x select 0)]
    };
} forEach GVAR(inventory_types);

_string