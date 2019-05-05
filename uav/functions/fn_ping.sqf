#include "x_macros.sqf"
private ["_position", "_radius", "_markers", "_enemies", "_units"];

PARAMS_2(_position, _radius);

_markers = [];
_enemies = [];

_units = _position nearEntities [["Man", "Car", "Tank"], _radius];

if (isNil "_units") exitWith {};

{
    if (side _x == east) then {
        _enemies = _enemies + [_x];
    };
} forEach _units;

if (count _enemies < 1) exitWith {};

{
    _marker = createMarker [format ["uav%1", _forEachIndex], getPos _x];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "DOT";
    
    _markers = _markers + [_marker];
} forEach _enemies;

sleep GVAR(uav_time_ping);

{
    deleteMarker (format ["uav%1", _forEachIndex]);
} forEach _markers;