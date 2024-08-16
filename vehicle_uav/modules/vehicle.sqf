/**
 * Vehicle UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([GVAR(vehicle_uav_type), typeOf _vehicle] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    _vehicle lock true;
    _vehicle allowCrewInImmobile true;
};

if (hasInterface) then {
    _vehicle addAction [
        "Disconnect" call FUNC(common,RedText),
        __function(release),
        [],
        10,
        false,
        true,
        "",
        "[typeOf _target, d_vehicle_uav_type] call BIS_fnc_areEqual && {count crew _target > 0}"
    ];
};