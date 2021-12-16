#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_weapons"];

PARAMS_1(_vehicle);

_weapons = [0, (_vehicle getVariable QGVAR(loadout)) select 1] call FUNC(common,arrayValues);

{
	[_vehicle, "addWeapon", if (typeName _x == "ARRAY") then {_x select 0} else {_x}] call FUNC(network,mp);
} forEach _weapons;