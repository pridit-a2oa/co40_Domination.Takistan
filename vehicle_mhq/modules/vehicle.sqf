/**
 * Vehicle MHQ Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_mhq
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_mhq_types)) exitWith {};

if (!isNil QMODULE(ammobox)) then {
    _vehicle setVariable [QGVAR(ammobox), true, true];
};