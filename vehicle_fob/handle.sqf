/**
 * Vehicle FOB Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    if !(isNil QMODULE(vehicle_deploy)) then {
        [GVAR(vehicle_deploy_types), GVAR(vehicle_fob_types)] call BIS_fnc_arrayPushStack;
    };
};