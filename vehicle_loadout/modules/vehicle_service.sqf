/**
 * Vehicle Loadout Module - Vehicle Service Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_weapons", "_magazine", "_ammo"];

PARAMS_1(_vehicle);

[_vehicle] call FUNC(THIS_MODULE,clear);

_weapons = (_vehicle getVariable QGVAR(loadout)) select 1;

{
	if (typeName (_x select 0) == "ARRAY") then {
		_magazine = (_x select 0) select 1;
	} else {
		_magazine = getArray (configFile >> "CfgWeapons" >> _x select 0 >> "magazines");
	};

	for "_i" from 1 to (_x select 1) do {
		_ammo = if (typeName (_x select 0) == "ARRAY") then {_magazine} else {_magazine select 0};

		[_vehicle, _ammo] call FUNC(vehicle_service,rearm);
	};
} forEach _weapons;

[_vehicle] call FUNC(THIS_MODULE,arm);