/**
 * Vehicle Lift Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if ([[GVAR(vehicle_lift_types), typeOf _vehicle] call BIS_fnc_findNestedElement, []] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(attached), objNull, true];
};

if (hasInterface) then {
    _vehicle addAction [
        "Lift" call FUNC(common,YellowText),
        __function(attach),
        "call d_fnc_vehicle_lift_valid",
        10,
        false,
        true,
        "",
        "!([typeName ([_target] call d_fnc_vehicle_lift_valid), ""BOOL""] call BIS_fnc_areEqual)"
    ];

    _vehicle addAction [
        "Release" call FUNC(common,RedText),
        __function(detach),
        nil,
        10,
        false,
        true,
        "",
        "[player, driver _target] call BIS_fnc_areEqual && {!isNull (_target getVariable ""d_attached"") && {speed _target <= d_vehicle_lift_speed && {(position _target) select 2 < d_vehicle_lift_height && {[uiNamespace getVariable ""d_notice"", displayNull] call BIS_fnc_areEqual}}}}"
    ];

    _vehicle addEventHandler ["getout", {
        67321 cutRsc ["Default", "PLAIN"];
    }];
};