#define THIS_MODULE base_wreck
#include "x_macros.sqf"
private ["_wreck", "_time"];

GVAR(rebuilding) = true;

_wreck = GVAR(wreck);

if (isNil "_wreck") exitWith {};

_time = {
    if (_wreck isKindOf _x) exitWith {
        (GVAR(base_wreck_time_rebuild) select _forEachIndex) select 0;
    };
} forEach GVAR(vehicle_wreck_types);

[_wreck, _time] call FUNC(THIS_MODULE,rebuild);