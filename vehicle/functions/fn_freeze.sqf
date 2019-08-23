#include "x_macros.sqf"
private ["_vehicle", "_helper"];

PARAMS_1(_vehicle);

if (alive _vehicle) exitWith {};
if (_vehicle isKindOf "LandVehicle") exitWith {};

while {((position _vehicle) select 2) > 1.5} do {
    sleep 1;
};

_position = [(position _vehicle) select 0, (position _vehicle) select 1, 0];

_helper = createVehicle ["RoadCone", _position, [], 0, "CAN_COLLIDE"];
_helper setDir (getDir _vehicle);
_helper setPos _position;

[nil, _helper, rHideObject, true] call RE;

_vehicle attachTo [_helper, [0, 0, if (_vehicle isKindOf "Plane") then {-0.5} else {1}]];

sleep 1;

_helper setPos [(position _vehicle) select 0, (position _vehicle) select 1, 0];
_helper setVectorUp surfaceNormal position _vehicle;

[nil, _helper, rEnableSimulation, false] call RE;