#include "x_macros.sqf"
private ["_marker"];

PARAMS_1(_marker);

deleteMarker _marker;

_markers = [];

{
    if !([markerPos (_x select 0), [0,0,0]] call BIS_fnc_areEqual) then {
        _markers = _markers + [_x];
    };
} forEach (X_JIPH getVariable QGVAR(markers));

X_JIPH setVariable [QGVAR(markers), _markers, true];