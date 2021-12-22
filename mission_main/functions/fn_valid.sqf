#include "x_macros.sqf"
private ["_flag", "_players", "_valid", "_time"];

PARAMS_2(_flag, _players);

_valid = true;

if ({isPlayer _x} count _players < 1) then {_valid = false};
if ({!alive _x || {_x getVariable QGVAR(unconscious)}} count _players == count _players) then {_valid = false};

if !(_valid) exitWith {
	if (_flag getVariable QGVAR(capturing)) then {
		_flag setVariable [QGVAR(capturing), false];
	};

	if (_flag getVariable QGVAR(time) != 0) then {
		_flag setVariable [QGVAR(time), 0, true];
	};
};

if !(_flag getVariable QGVAR(capturing)) then {
	_flag setVariable [QGVAR(capturing), true];

	if (!isNil QMODULE(3d)) then {
		[true, "execVM", [
			[_flag, GVAR(mission_main_time_capture)],
			FUNCTION(3d,time)
		]] call FUNC(network,mp);
	};
};

true