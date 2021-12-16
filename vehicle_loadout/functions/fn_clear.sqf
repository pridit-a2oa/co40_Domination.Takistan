#include "x_macros.sqf"
private ["_vehicle", "_weapons", "_magazines", "_turrets"];

PARAMS_1(_vehicle);

_weapons = weapons _vehicle;
_magazines = magazines _vehicle;

_turrets = [
	_vehicle magazinesTurret [-1],
	_vehicle magazinesTurret [0],
	_vehicle magazinesTurret [1],
	_vehicle magazinesTurret [2]
];

while {count weapons _vehicle > 1} do {
	{
		if (["CMFlareLauncher"] find _x == -1) then {
			[_vehicle, "removeWeapon", _x] call FUNC(network,mp);
		};
	} forEach _weapons;
};

while {count magazines _vehicle > 1} do {
	{
		if (["120Rnd_CMFlare_Chaff_Magazine", "60Rnd_CMFlare_Chaff_Magazine"] find _x == -1) then {
			[_vehicle, "removeMagazines", _x] call FUNC(network,mp);
		};
	} forEach _magazines;
};

{
	_path = _forEachIndex - 1;

	while {count (_vehicle magazinesTurret [_path]) > 1} do {
		{
			if (["120Rnd_CMFlare_Chaff_Magazine", "60Rnd_CMFlare_Chaff_Magazine"] find _x == -1) then {
				[_vehicle, "removeMagazinesTurret", [_x, _path]] call FUNC(network,mp);
			};
		} forEach (_turrets select _forEachIndex);
	};
} forEach _turrets;