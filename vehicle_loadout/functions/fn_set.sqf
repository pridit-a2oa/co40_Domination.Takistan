#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_name", "_checks", "_find", "_loadout", "_loadouts", "_type"];

PARAMS_1(_vehicle);

if (hasInterface) then {
	_name = [typeOf _vehicle] call FUNC(vehicle,name);
	_checks = [
		[
			[format ["%1 loadout", _name], "changed"],
			_vehicle
		] call FUNC(helper,isOccupied),

		[
			[format ["%1 loadout", _name], "changed"],
			markerPos QGVAR(base_south),
			position _vehicle,
			[GVAR(vehicle_loadout_distance_base), "within", "of base"]
		] call FUNC(helper,distanceFrom)
	];

	{
		if (typeName _x == "STRING") exitWith {
			hint _x;
		};
	} forEach _checks;
};

if (isServer || {(hasInterface && {str (_x) == "true"} count _checks == count _checks)}) then {
	_find = [_vehicle] call FUNC(THIS_MODULE,find);

	_loadouts = _find select 0;
	_loadout = _find select 1;

	{
		_index = (_forEachIndex + 1);

		if (isNil {_vehicle getVariable QGVAR(loadout)} || {_x == (_vehicle getVariable QGVAR(loadout)) select 0}) exitWith {
			_type = _loadouts select _index;

			if (count _loadouts == _index) then {
				_type = _loadouts select 0;
				_index = 0;
			};

			if (isNil {_vehicle getVariable QGVAR(loadout)}) then {
				_type = _loadouts select (_loadouts find "Standard");
				_index = _loadouts find "Standard";
			};

			_vehicle setVariable [
				QGVAR(loadout),
				[
					_type,
					([1, (GVAR(vehicle_loadout_types) select _loadout) select 1] call FUNC(common,arrayValues)) select _index
				],
				true
			];

			[_vehicle] call FUNC(THIS_MODULE,clear);
		};
	} forEach _loadouts;
};