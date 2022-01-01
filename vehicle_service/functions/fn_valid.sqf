#include "x_macros.sqf"
private ["_trigger", "_type", "_service", "_vehicle"];

PARAMS_1(_trigger);

_type = _trigger getVariable "type";
_service = _trigger getVariable "object";

_vehicle = (nearestObjects [position _service, _type, 10]) select 0;

if (isNil "_vehicle") exitWith {false};
if (!alive _vehicle) exitWith {false};
if ({isPlayer _x} count crew _vehicle < 1) exitWith {false};

_time = _service getVariable QGVAR(time);

if (_time > 0 && {(_time - call FUNC(common,time)) > GVAR(vehicle_service_time_cooldown)}) then {
    _service setVariable [QGVAR(time), 0];
};

if (_service getVariable QGVAR(time) > call FUNC(common,time)) exitWith {false};
if (_vehicle getVariable QGVAR(servicing)) exitWith {false};

if ((position _vehicle) select 2 > 1) exitWith {false};
if (speed _vehicle > GVAR(vehicle_service_speed)) exitWith {false};

_service setVariable [QGVAR(vehicle), _vehicle];

true