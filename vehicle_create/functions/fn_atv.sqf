#include "x_macros.sqf"
private ["_vehicle", "_position", "_atv"];
PARAMS_1(_vehicle);

_position = _vehicle modelToWorld [-4,0,0];

_atv = createVehicle ["ATV_US_EP1", [_position select 0, _position select 1, 0], [], 0, "NONE"];
_atv setDir ((direction _vehicle) - 180);
_atv setVectorUp (vectorUp _vehicle);
_atv setPos [_position select 0, _position select 1, 0];

[nil, nil, rEXECVM, __moduleRE(vehicle), _atv] call RE;