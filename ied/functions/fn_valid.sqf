#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_unit", "_ied", "_distance", "_speed"];

_unit = if (player != vehicle player) then {vehicle player} else {player};

_ied = [_unit] call FUNC(THIS_MODULE,near);

if (isNil "_ied") exitWith {false};

_distance = _unit distance _ied <= (GVAR(ied_trigger_distances) select 0);

if (_distance) exitWith {true};

_speed = speed _unit < GVAR(ied_trigger_speed);

if (_speed) exitWith {false};

true