#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_name", "_checks", "_loadout", "_types", "_type"];

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

	if ({str (_x) == "true"} count _checks < count _checks) exitWith {};

	if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(set)]] call FUNC(network,mp);
    };
};

if (isServer) then {
	_loadout = ([0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);
	_types = [0, (GVAR(vehicle_loadout_types) select _loadout) select 1] call FUNC(common,arrayValues);

	{
		_index = (_forEachIndex + 1);

		if (isNil {_vehicle getVariable QGVAR(loadout)} || {_x == (_vehicle getVariable QGVAR(loadout)) select 0}) exitWith {
			_type = _types select _index;

			if (isNil {_vehicle getVariable QGVAR(loadout)} || count _types == _index) then {
				_index = 0;
				_type = _types select 0;
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
	} forEach _types;
};