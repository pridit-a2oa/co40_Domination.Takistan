#include "x_macros.sqf"
private ["_vehicle", "_towing", "_tow", "_towed", "_position_front", "_position_behind", "_direction", "_direction_front", "_direction_behind"];

_vehicle = [typeOf (vehicle player), GVAR(vehicle_tow_type)] call BIS_fnc_areEqual;

if !(_vehicle) exitWith {false};

_towing = (vehicle player) getVariable QGVAR(towing);

if !(isNull _towing) exitWith {false};

_tow = ((vehicle player) nearEntities [GVAR(vehicle_tow_type_towable), 20]) select 0;

if (isNil "_tow") exitWith {false};
if !(alive _tow) exitWith {false};

_towed = _tow getVariable QGVAR(towed);

if (_towed) exitWith {false};

_speed = (speed (vehicle player) > 10 || {speed (vehicle player) < -10});

if (_speed) exitWith {false};

_position_front = (vehicle player) distance (_tow modelToWorld [0, if ([typeOf _tow, "C130J_US_EP1"] call BIS_fnc_areEqual) then {17} else {7}, 0]) > 8;
_position_behind = (vehicle player) distance (_tow modelToWorld [0, -7, 0]) > 8;

if (_position_front && {_position_behind}) exitWith {false};

_direction = abs (round (getDir (vehicle player)) - (round (getDir _tow)));
_direction_front = (abs _direction) > 20;
_direction_behind = (abs (_direction - 180)) > 20;

if (_position_front && {_direction_behind}) exitWith {false};
if (_position_behind && {_direction_front}) exitWith {false};

GVAR(tow) = _tow;

true