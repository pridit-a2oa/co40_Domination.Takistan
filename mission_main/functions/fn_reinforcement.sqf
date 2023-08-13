#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_type", "_vehicle", "_aircraft", "_crew", "_pilot"];

PARAMS_2(_target, _type);

if ([_target, [1, GVAR(mission_main_type_reinforcements), true] call FUNC(common,arrayValues)] call FUNC(THIS_MODULE,exists)) exitWith {};

_vehicle = (_type select 1) call BIS_fnc_selectRandom;
_vehicle = [position _target, _vehicle, GVAR(mission_main_distance_reinforcement), 200, east] call FUNC(server,spawnVehicle);

_aircraft = _vehicle select 0;
_crew = _vehicle select 1;
_pilot = driver _aircraft;

if (!isNil QMODULE(vehicle_respawn)) then {
    _aircraft setVariable [QGVAR(respawnable), false, true];
};

_pilot setSkill 1;

(group _pilot) setBehaviour "CARELESS";

switch (_type select 0) do {
    case "aircraft": {
        _aircraft flyInHeight 140;

        if (!isNil QMODULE(vehicle_wreck)) then {
            [_aircraft] spawn FUNC(vehicle_wreck,handle);
        };
        
        if (!isNil QMODULE(unit)) then {
            [group _pilot, position _target, 600, 4] call FUNC(unit,patrol);
        };
    };

    case "infantry": {
        private ["_group"];

        _aircraft flyInHeight 100;
        
        __addDead(_aircraft);
        
        if (!isNil QMODULE(unit)) then {
             _group = [
                [0, 0, 0],
                east,
                (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_SpecialPurposeSquad")
            ] call FUNC(server,spawnGroup);
            
            {
                _x moveInCargo _aircraft;
            } forEach (units _group);

            _target setVariable [QGVAR(units), (_target getVariable QGVAR(units)) + (units _group)];
        };

        _pilot move (position _target);
        
        while {alive _aircraft && {canMove _aircraft}} do {
            if (_aircraft distance (position _target) < 600) exitWith {
                {
                    if !([assignedVehicleRole _x find "Cargo", -1] call BIS_fnc_areEqual) then {
                        unassignVehicle _x;

                        _x action ["Eject", _aircraft];
                    };
                    
                    sleep (1 + random 0.5);
                } forEach crew _aircraft;

                if !(isNil QMODULE(unit)) then {
                    [_group, position _target, 600, 4] call FUNC(unit,patrol);
                };

                [_aircraft] spawn FUNC(server,exitMap);
            };
            
            sleep 2;
        };
    };
};