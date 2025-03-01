/**
 * Vehicle UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in GVAR(vehicle_uav_types)) exitWith {};

if (isServer) then {
    _vehicle lock true;
    _vehicle allowCrewInImmobile true;
};

if (hasInterface) then {
    _vehicle addAction [
        "Disconnect" call FUNC(common,RedText),
        __function(disconnect),
        [],
        10,
        false,
        true,
        "",
        "player in _target"
    ];
};