#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

{
    if (_vehicle isKindOf _x) exitWith {
        ([0, GVAR(vehicle_abandon_types)] call FUNC(common,arrayValues)) select _forEachIndex;
    };
} forEach ([1, GVAR(vehicle_abandon_types)] call FUNC(common,arrayValues));