#include "x_macros.sqf"
private ["_aircraft", "_landing", "_load", "_position"];

PARAMS_3(_aircraft, _landing, _load);

if (typeName _load == "ARRAY") then {
    _position = _load select 1;
    _load = _load select 0;
};

_load = createVehicle [_load, [0, 0, 0], [], 0, "NONE"];

[_aircraft, _landing, _load, _position] spawn {
    private ["_aircraft", "_landing", "_load", "_position", "_ammobox"];
    
    PARAMS_4(_aircraft, _landing, _load, _position);
    
    _load attachTo [_aircraft, [0, 2, -2]];

    if (!isNil "_position") then {
        _load setVariable [QGVAR(position), _position, true];
    };

    sleep 1;

    _aircraft animate ["ramp_top", 1];
    _aircraft animate ["ramp_bottom", 1];

    sleep 3;

    _aircraft animate ["ramp_top", 0];
    _aircraft animate ["ramp_bottom", 0];

    _position = _aircraft modelToWorld [0, -15, -5];

    _load setDir (direction _aircraft);
    _load setPos _position;
    _load setVectorUp (vectorUp _aircraft);

    detach _load;

    if (!isNil QMODULE(vehicle) && {_load isKindOf "AllVehicles"}) then {
        [nil, nil, rExecVM, __handlerRE(vehicle), _load] call RE;
    };

    if ((position _aircraft) select 2 > 100) then {
        _parachute = createVehicle ["ParachuteMediumWest", _position, [], 0, "NONE"];
        _parachute setPos _position;

        _load attachTo [_parachute, [0, 0, 1]];
        
        [_parachute, _load, _landing, 0] call FUNC(common,mandoChute);
        
        waitUntil {(position _load) select 2 < 3};

        _position = [(position _load) select 0, (position _load) select 1, 0];
    };

    if (!isNil QMODULE(ammobox) && {typeOf _load == GVAR(ammobox_type)}) then {
        deleteVehicle _load;
        
        _ammobox = [_position, 0, false] call FUNC(ammobox,create);

        [_ammobox] call FUNC(vehicle_ammobox,replenish);

        [nil, nil, rExecVM, __handlerRE(ammobox), _ammobox] call RE;
    };
};

_load