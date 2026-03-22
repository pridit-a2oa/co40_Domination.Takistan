/**
 * Vehicle Marker Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (_vehicle isKindOf "ParachuteBase") exitWith {};
if ([{_vehicle isKindOf _x} count GVAR(vehicle_marker_types), 0] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    _vehicle setVariable [
        QGVAR(marker),
        [format [" %1", [typeOf _vehicle] call FUNC(vehicle,name)]],
        true
    ];

    if (isNil {_vehicle getVariable QGVAR(hidden)}) then {
        _vehicle setVariable [QGVAR(hidden), false, true];
    };
};

if (hasInterface) then {
    [_vehicle] call FUNC(THIS_MODULE,create);
};