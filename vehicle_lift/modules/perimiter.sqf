/**
 * Vehicle Lift Module - Perimiter Submodule
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle", "_attached"];

PARAMS_1(_vehicle);

if (!isNull (_vehicle getVariable QGVAR(attached))) then {
    _attached = _vehicle getVariable QGVAR(attached);
    
    [_vehicle, "", "", _attached] call FUNC(THIS_MODULE,release);
    
    _attached setPos [0, 0, 0];
};