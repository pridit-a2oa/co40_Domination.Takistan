#include "x_macros.sqf"
private ["_target", "_type", "_vehicle", "_aircraft", "_crew", "_pilot"];

PARAMS_2(_target, _type);

_vehicle = (_type select 1) call BIS_fnc_selectRandom;
_vehicle = [position _target, _vehicle, GVAR(mission_main_distance_reinforcement), 200, east] call FUNC(server,spawnVehicle);

_aircraft = _vehicle select 0;
_crew = _vehicle select 1;
_pilot = driver _aircraft;

_aircraft flyInHeight 80;

if (!isNil QMODULE(vehicle_respawn)) then {
    _aircraft setVariable [QGVAR(respawnable), false, true];
};

_pilot setSkill 1;

(group _pilot) setBehaviour "CARELESS";

switch (_type select 0) do {
    case "aircraft": {
        if (!isNil QMODULE(vehicle_wreck)) then {
            [_aircraft] spawn FUNC(vehicle_wreck,handle);
        };
        
        (group _pilot) setSpeedMode "LIMITED";
        
        if (!isNil QMODULE(unit)) then {
            [group _pilot, position _target, 600, 4] call FUNC(unit,patrol);
        };
    };

    case "infantry": {
        private ["_land", "_helper", "_group"];
        
        __addDead(_aircraft);
        
        if (!isNil QMODULE(unit)) then {
            _group = [[0, 0, 0], east, 4 + round (random 2)] call FUNC(server,spawnGroup);
            
            {
                _x moveInCargo _aircraft;
            } forEach (units _group);

            _target setVariable [QGVAR(units), (_target getVariable QGVAR(units)) + (units _group)];
        };
        
        _land = [position _target, 50, GVAR(mission_main_radius_zone) / 1.5, 3, 0, 0.7, 0] call FUNC(common,safePos);
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

                        if (!isNil QMODULE(unit)) then {
                            [_group, _land] call FUNC(unit,defend);
                        };
                        
                        sleep 10;
                        
                        [_aircraft] spawn FUNC(server,exitMap);
                    };
                    
                    sleep 2;
                };
            };
            
            sleep 2;
        };
    };
};