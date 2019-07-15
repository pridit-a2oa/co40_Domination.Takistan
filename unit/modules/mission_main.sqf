/**
 * Unit Module - Mission Main Submodule
 */

#define THIS_MODULE unit
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

// TODO: this will need to be substantially improved

for "_i" from 1 to 6 do {
    _infantry = GVAR(unit_type_infantry) call BIS_fnc_selectRandom;

    _position = [position _target, 50, GVAR(mission_main_radius_zone) / 1.5, 3, 0, 0.7, 0] call FUNC(common,safePos);

    _group = [_position, east, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> _infantry)] call FUNC(server,spawnGroup);
    
    if (!isNil QMODULE(headless)) then {
        waitUntil {!isNil {missionNamespace getVariable "group"}};
        
        _group = missionNamespace getVariable "group";
        
        missionNamespace setVariable ["group", nil];
    };

    [_group, position _target, 600, 4] call FUNC(unit,patrol);
};

_roads = [position _target, GVAR(mission_main_radius_zone)] call FUNC(THIS_MODULE,road);

for "_i" from 1 to 3 do {
    _light = GVAR(unit_type_vehicle_light) call BIS_fnc_selectRandom;
    
    _vehicle = [_roads call BIS_fnc_selectRandom, _light, 5, 0, east, random 360] call FUNC(server,spawnVehicle);
    
    if (!isNil QMODULE(headless)) then {
        waitUntil {!isNil {missionNamespace getVariable "vehicle"}};
        
        _vehicle = missionNamespace getVariable "vehicle";
        
        missionNamespace setVariable ["vehicle", nil];
    };
    
    __addDead(_vehicle select 0);
    
    [_vehicle select 2, position _target, GVAR(mission_main_radius_zone), 4] call FUNC(unit,patrol);
};

for "_i" from 1 to 7 do {
    _armor = GVAR(unit_type_vehicle_armor) call BIS_fnc_selectRandom;
    
    _vehicle = [_roads call BIS_fnc_selectRandom, _armor, 5, 0, east, random 360] call FUNC(server,spawnVehicle);
    
    if (!isNil QMODULE(headless)) then {
        waitUntil {!isNil {missionNamespace getVariable "vehicle"}};
        
        _vehicle = missionNamespace getVariable "vehicle";
        
        missionNamespace setVariable ["vehicle", nil];
    };
    
    if (!isNil QMODULE(vehicle_wreck)) then {
        [_vehicle select 0] __handler("vehicle_wreck");
    };
    
    [_vehicle select 2, position _target, GVAR(mission_main_radius_zone), 4] call FUNC(unit,patrol);
};