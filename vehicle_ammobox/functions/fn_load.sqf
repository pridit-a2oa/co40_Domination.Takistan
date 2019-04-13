#include "x_macros.sqf"
private ["_vehicle", "_ammoload", "_nearest", "_ammobox"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

_ammoload = getPos GVAR(ammoload);
_nearest = nearestObjects [_vehicle, ["USVehicleBox_EP1"], 10];

if (count _nearest == 0 && {_vehicle distance _ammoload > 5}) exitWith {};

_ammobox = _nearest select 0;

if (_ammobox getVariable QGVAR(immune)) exitWith {};
if (!alive _ammobox) exitWith {};

if (!isNil "_nearest") then {
    deleteVehicle _ammobox;
};

[nil, _vehicle, rSay, QGVAR(sound_box), 20] call RE;

_vehicle setVariable [QGVAR(ammobox), true, true];