/**
 * Vehicle Cargo Module - Vehicle Marker Submodule
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_marker", "_cargo"];

PARAMS_2(_vehicle, _marker);

if !(typeOf _vehicle in ([0, GVAR(vehicle_cargo_types)] call FUNC(common,arrayValues))) exitWith {_marker};

_cargo = _vehicle getVariable QGVAR(cargo);

if ([count _cargo, 0] call BIS_fnc_areEqual) exitWith {_marker};

_marker set [1, format ["+%1", count _cargo]];

_marker