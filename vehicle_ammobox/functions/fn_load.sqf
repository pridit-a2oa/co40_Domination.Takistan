#include "x_macros.sqf"
private ["_vehicle", "_ammoload", "_nearest", "_ammobox"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_ammobox_types)) exitWith {false};

_ammoload = getPos GVAR(ammoload);
_nearest = nearestObjects [_vehicle, [([faction _vehicle] call FUNC(ammobox,type)) select 1], 10];

if ([count _nearest, 0] call BIS_fnc_areEqual && {_vehicle distance _ammoload > 10}) exitWith {false};

_ammobox = _nearest select 0;

if (_ammobox getVariable QGVAR(immune)) exitWith {};
if (!alive _ammobox) exitWith {};

if (!isNil "_nearest") then {
    deleteVehicle _ammobox;
};

_vehicle setVariable [QGVAR(ammobox), true, true];

true