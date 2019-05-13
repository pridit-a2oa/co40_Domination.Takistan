#include "x_macros.sqf"
private ["_vehicle", "_helper"];

PARAMS_1(_vehicle);

if (alive _vehicle) exitWith {};

while {((position _vehicle) select 2) > 1} do {
    sleep 1;
};

_position = [(position _vehicle) select 0, (position _vehicle) select 1, 0];

_helper = "HeliHEmpty" createVehicle _position;
_helper setDir (getDir _vehicle);
_helper setPos _position;

_vehicle attachTo [_helper, [0, 0, if (_vehicle isKindOf "Plane") then {-0.5} else {1}]];

sleep 1;

_helper setPos [(position _vehicle) select 0, (position _vehicle) select 1, 0];

[nil, _helper, rEnableSimulation, false];

_vehicle setVectorUp surfaceNormal position _vehicle;