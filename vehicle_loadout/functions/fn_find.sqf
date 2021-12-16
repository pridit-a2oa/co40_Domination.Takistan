#include "x_macros.sqf"
private ["_vehicle", "_loadout", "_types"];

PARAMS_1(_vehicle);

_loadout = ([0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);
_types = [0, (GVAR(vehicle_loadout_types) select _loadout) select 1] call FUNC(common,arrayValues);

[_types, _loadout]