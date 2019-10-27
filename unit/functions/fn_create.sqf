#define THIS_MODULE unit
#include "x_macros.sqf"
private ["_type", "_amount", "_position", "_radius", "_heavy", "_roads", "_units", "_safe", "_group", "_vehicle", "_vehicles"];

PARAMS_4(_type, _amount, _position, _radius);

_heavy = GVAR(unit_type_vehicles_heavy);

_roads = _position nearRoads _radius;

_units = [];

for "_i" from 1 to _amount do {    
    _units = _units + [switch (_type) do {
        case "infantry": {
            _safe = [
                _position,
                50,
                _radius / 1.5,
                3,
                0,
                0.7,
                0
            ] call FUNC(common,safePos);
            
            _group = [
                _safe,
                east,
                [GVAR(unit_type_infantry) call BIS_fnc_selectRandom] call FUNC(THIS_MODULE,type)
            ] call FUNC(server,spawnGroup);
            
            _group
        };
        
        case "light": {
            _vehicle = [
                _roads call BIS_fnc_selectRandom,
                GVAR(unit_type_vehicles_light) call BIS_fnc_selectRandom,
                5,
                0,
                east,
                random 360
            ] call FUNC(server,spawnVehicle);
            
            __addDead(_vehicle select 0);
            
            _vehicle select 2
        };
        
        case "heavy": {
            _vehicles = [0, _heavy] call FUNC(common,arrayValues);
            
            _unit = _vehicles call BIS_fnc_selectRandom;
            
            _vehicle = [
                _roads call BIS_fnc_selectRandom,
                _unit,
                5,
                0,
                east,
                random 360
            ] call FUNC(server,spawnVehicle);
            
            if (([1, _heavy] call FUNC(common,arrayValues)) select (_vehicles find _unit)) then {
                _heavy = [_heavy, _vehicles find _unit] call FUNC(common,deleteAt);
            };
            
            if (!isNil QMODULE(vehicle_wreck)) then {
                [_vehicle select 0] spawn FUNC(vehicle_wreck,handle);
            };
            
            _vehicle select 2
        };
    }];
};

_units