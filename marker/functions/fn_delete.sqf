#include "x_macros.sqf"
private ["_marker"];

PARAMS_1(_marker);

[nil, nil, rSpawn, _marker, {deleteMarkerLocal _this}] call RE;

_markers = [];

{
    if (str (markerPos (_x select 0)) != "[0,0,0]") then {
        _markers = _markers + [_x];
    };
} forEach (X_JIPH getVariable QGVAR(markers));

X_JIPH setVariable [QGVAR(markers), _markers, true];