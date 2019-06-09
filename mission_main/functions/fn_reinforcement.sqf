#include "x_macros.sqf"
private ["_target", "_type"];

PARAMS_2(_target, _type);

_type = {
    if (_x select 0 == _type) exitWith {
        _x
    };
} forEach GVAR(mission_main_type_reinforcements);

_vehicle = (_type select 1) call BIS_fnc_selectRandom;
_vehicle = [position _target, _vehicle, GVAR(mission_main_distance_reinforcement), 200, east] call FUNC(server,spawnVehicle);

_aircraft = _vehicle select 0;
_crew = _vehicle select 1;
_pilot = driver _aircraft;

_aircraft flyInHeight 80;
_aircraft allowCrewInImmobile true;

if (!isNil QMODULE(vehicle_respawn)) then {
    _aircraft setVariable [QGVAR(respawnable), false, true];
};

_pilot setSkill 1;

(group _pilot) setBehaviour "CARELESS";

switch (_type select 0) do {
    case "aircraft": {
        if (!isNil QMODULE(vehicle_wreck) && {GVAR(vehicle_wreck_chance_enemy) > random 100}) then {
            _aircraft setVariable [QGVAR(wreckable), true, true];
            
            if (!isNil QMODULE(crossroad)) then {
                _aircraft addMPEventHandler ["MPKilled", {
                    (_this select 0) spawn {
                        sleep 10;
                        
                        GVAR(crossroad) kbTell [GVAR(crossroad2), "vehicle_wreck", "Detected", ["1", {}, [typeOf _this] call FUNC(vehicle,name), []], true];
                    };
                }];
            };
        };
        
        (group _pilot) setSpeedMode "LIMITED";
        
        if (!isNil QMODULE(unit)) then {
            [group _pilot, position _target, 600, 4] call FUNC(unit,patrol);
        };
    };

    case "infantry": {
        if (!isNil QMODULE(unit)) then {
            _group = [[0, 0, 0], east, 4 + round (random 2)] call BIS_fnc_spawnGroup;
            
            {
                _x moveInCargo _aircraft;
            } forEach (units _group);
        };
        
        _land = [position _target, 50, 300, 3, 0, 0.7, 0] call FUNC(common,safePos);
        _helper = "HeliHEmpty" createVehicleLocal _land;
        
        _pilot doMove _land;
        
        while {alive _aircraft && {canMove _aircraft}} do {
            if (unitReady _pilot) exitWith {
                sleep 0.1;
                
                _aircraft land "GET OUT";

                while {alive _aircraft && {canMove _aircraft}} do {
                    if ((position _aircraft) select 2 < 5) exitWith {
                        deleteVehicle _helper;
                        
                        {
                            if (assignedVehicleRole _x find "Cargo" != -1) then {
                                unassignVehicle _x;
                                moveOut _x;
                            };
                            
                            sleep (0.5 + random 0.5);
                        } forEach crew _aircraft;
                        
                        sleep 10;
                        
                        [_aircraft] call FUNC(server,exitMap);
                    };
                    
                    sleep 2;
                };
            };
            
            sleep 2;
        };
    };
};