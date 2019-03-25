/**
 * Vehicle Ammobox Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

if (!isNil QMODULE(ammobox)) then {
    _vehicle setVariable [QGVAR(ammobox), true, true];
};