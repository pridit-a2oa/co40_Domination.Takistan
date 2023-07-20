#include "x_macros.sqf"
private ["_vehicle", "_spawn"];

PARAMS_1(_vehicle);

_spawn = _vehicle getVariable QGVAR(spawn);

_vehicle setPos [_spawn select 0, _spawn select 1, 0];

[_vehicle, "setVectorUp", surfaceNormal _spawn] call FUNC(network,mp);
[_vehicle, "setVelocity", [0, 0, 0]] call FUNC(network,mp);
[_vehicle, "engineOn", false] call FUNC(network,mp);