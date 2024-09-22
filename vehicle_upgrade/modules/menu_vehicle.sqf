/**
 * Vehicle Upgrade Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_upgrade
#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_upgrade_types)) exitWith {false};

_type = (player getVariable QGVAR(vehicle_upgrade_type)) select 1;

if ([typeOf _vehicle, _type] call BIS_fnc_areEqual) exitWith {false};

[
    format [
        "Upgrade: %1",
        [_type] call FUNC(vehicle,name)
    ],
    "upgrade"
] call FUNC(menu,populate);

true