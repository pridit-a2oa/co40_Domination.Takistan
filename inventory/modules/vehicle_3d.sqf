/**
 * Inventory Module - Vehicle 3D Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_array"];

PARAMS_1(_vehicle);

_array = [];

{
    if (_vehicle in (_x select 2)) then {
        _array = _array + [format ["%1 Replenisher", _x select 0]]
    };
} forEach GVAR(inventory_types);

_array