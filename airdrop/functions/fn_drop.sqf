#include "x_macros.sqf"
private ["_aircraft", "_position"];
PARAMS_2(_aircraft, _position);

_smoke = GVAR(airdrop_smoke) createVehicle _position;

waitUntil {_aircraft distance _position < 350};

_aircraft animate ["ramp_top", 1];
_aircraft animate ["ramp_bottom", 1];

sleep 3;

_aircraft animate ["ramp_top", 0];
_aircraft animate ["ramp_bottom", 0];

_spawn = _aircraft modelToWorld [0,-20,-10];

_parachute = createVehicle ["ParachuteMediumWest", _spawn, [], 0, "FLY"];
_parachute setPos _spawn;

_drop = [position _parachute, 0, false] call FUNC(ammobox,create);
_drop attachTo [_parachute, [0,0,0]];

[_drop] call FUNC(vehicle_ammobox,replenish);

[nil, nil, rExecVM, __moduleRE(ammobox), _drop] call RE;

[_parachute, _drop, _position, 0] call FUNC(client,mandoChute);

_aircraft animate ["ramp_top", 0];
_aircraft animate ["ramp_bottom", 0];

waitUntil {(position _drop) select 2 < 5};

deleteVehicle _smoke;