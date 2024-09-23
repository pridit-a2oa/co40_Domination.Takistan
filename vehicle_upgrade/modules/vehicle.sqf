/**
 * Vehicle Upgrade Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_upgrade_types)) exitWith {false};

if (isNil {_vehicle getVariable QGVAR(type)}) then {
    _vehicle setVariable [QGVAR(type), typeOf _vehicle];
};

_vehicle setVariable [QGVAR(upgrade), false, true];