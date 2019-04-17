#include "x_macros.sqf"
private ["_aircraft", "_position", "_object"];
PARAMS_3(_aircraft, _position, _drop);

_smoke = GVAR(airdrop_smoke) createVehicle _position;

waitUntil {_aircraft distance _position < 325};

_aircraft animate ["ramp_top", 1];
_aircraft animate ["ramp_bottom", 1];

sleep 3;

_aircraft animate ["ramp_top", 0];
_aircraft animate ["ramp_bottom", 0];

_spawn = _aircraft modelToWorld [0,-20,-5];

_parachute = createVehicle ["ParachuteMediumWest", _spawn, [], 0, "NONE"];
_parachute setPos _spawn;

_payload = createVehicle [_drop, position _parachute, [], 0, "NONE"];
_payload attachTo [_parachute, [0,0,1]];

[_parachute, _payload, _position, 0] call FUNC(client,mandoChute);

waitUntil {(position _payload) select 2 < 5};

_position = [(position _parachute) select 0, (position _parachute) select 1, 0];

if (!isNil QMODULE(ammobox) && {_drop == GVAR(ammobox_type)}) exitWith {
    deleteVehicle _payload;
    
    _ammobox = [_position, 0, false] call FUNC(ammobox,create);

    [_ammobox] call FUNC(vehicle_ammobox,replenish);

    [nil, nil, rExecVM, __moduleRE(ammobox), _ammobox] call RE;
};

_payload setDamage 0;
_payload setFuel 1;

hint format ["%1", _payload];

[_payload] __module(vehicle);