#include "x_macros.sqf"

PARAMS_4(_aircraft, _landing, _loaded, _eject);

if (typeName _loaded == "ARRAY") then {
    _loaded = _loaded select 0;
};

if (typeName _eject == "STRING") then {
    _eject = [[0, -15, -5], direction _aircraft];
};

_load = createVehicle [_loaded, [0, 0, 0], [], 0, "NONE"];

if (typeName _loaded == "ARRAY") then {
    _load setVariable [QGVAR(position), (_this select 2) select 1, true];
    _load setVariable [QGVAR(direction), (_this select 2) select 2, true];
};

[_aircraft, _landing, _load, _eject] spawn {
    private ["_aircraft", "_landing", "_load", "_eject", "_position", "_ammobox"];
    
    PARAMS_4(_aircraft, _landing, _load, _eject);
    
    _load attachTo [_aircraft, [_load] call FUNC(common,attachPoint)];
    
    if (alive _aircraft) then {
        sleep 1;

        _aircraft animate ["ramp_top", 1];
        _aircraft animate ["ramp_bottom", 1];

        sleep 3;

        _aircraft animate ["ramp_top", 0];
        _aircraft animate ["ramp_bottom", 0];
    };
    
    _position = _aircraft modelToWorld (_eject select 0);
    
    if (direction _aircraft != _eject select 1) then {
        detach _load;
    };
    
    _load setDir (_eject select 1);
    _load setPos _position;
    _load setVectorUp (vectorUp _aircraft);
    
    if (direction _aircraft == _eject select 1) then {
        detach _load;
    };
    
    if (!isNil QMODULE(vehicle) && {_load isKindOf "AllVehicles"}) then {
        [nil, nil, rExecVM, __handlerRE(vehicle), _load] call RE;
        [nil, nil, rSpawn, [_load], {player reveal (_this select 0)}] call RE;
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
        
        if (!isNil QMODULE(vehicle_ammobox)) then {
            [_ammobox] call FUNC(vehicle_ammobox,replenish);
        };
        
        [nil, nil, rExecVM, __handlerRE(ammobox), _ammobox] call RE;
    };
};

_load