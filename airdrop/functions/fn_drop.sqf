#include "x_macros.sqf"
private ["_aircraft", "_position", "_object"];
PARAMS_3(_aircraft, _position, _drop);

waitUntil {_aircraft distance _position < 450};

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

waitUntil {(position _payload) select 2 < 3};

_position = [(position _parachute) select 0, (position _parachute) select 1, 0];

if (!isNil QMODULE(ammobox) && {_drop == GVAR(ammobox_type)}) exitWith {
    deleteVehicle _payload;
    
    _ammobox = [_position, 0, false] call FUNC(ammobox,create);

    [_ammobox] call FUNC(vehicle_ammobox,replenish);

    [nil, nil, rExecVM, __handlerRE(ammobox), _ammobox] call RE;
};

if (!isNil QMODULE(vehicle)) then {
    [nil, nil, rExecVM, __handlerRE(vehicle), _payload] call RE;
};

sleep 1;

_payload setDamage 0;
_payload setFuel 1;