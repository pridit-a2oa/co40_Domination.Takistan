#include "x_macros.sqf"
private ["_trigger", "_units", "_type", "_service", "_time", "_vehicle"];

PARAMS_2(_trigger, _units);

_type = _trigger getVariable "type";
_service = _trigger getVariable "object";

_time = _service getVariable QGVAR(time);

if (_time > 0 && {(_time - call FUNC(common,time)) > GVAR(vehicle_service_time_cooldown)}) then {
    _service setVariable [QGVAR(time), 0];
};

if (_service getVariable QGVAR(time) > call FUNC(common,time)) exitWith {false};

{
    if ((vehicle _x) isKindOf _type && {alive (vehicle _x)}) exitWith {
        _vehicle = vehicle _x;
    };
} forEach _units;

if (isNil "_vehicle") exitWith {false};

if (_vehicle getVariable QGVAR(servicing)) exitWith {false};

if (isNull (driver _vehicle)) exitWith {false};
if !(isPlayer (driver _vehicle)) exitWith {false};
if ((position _vehicle) select 2 > 1) exitWith {false};
if (speed _vehicle > GVAR(vehicle_service_speed)) exitWith {false};

_service setVariable [QGVAR(vehicle), _vehicle];

true