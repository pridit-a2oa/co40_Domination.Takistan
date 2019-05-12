#include "x_macros.sqf"
private ["_type", "_objects", "_position", "_group"];

PARAMS_3(_type, _objects, _position);

_units = [];

switch (_type) do {
    case "base": {
        _group = createGroup west;

        {
            _x lock true;
            _x allowCrewInImmobile true;
            
            _x addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1}];
            _x addEventHandler ["HandleDamage", {0}];
            
            _crew = [_x, _group] call BIS_fnc_spawnCrew;
            
            {
                _x addEventHandler ["HandleDamage", {0}];
            } forEach _crew;
            
            if (!(_x isKindOf "StaticVehicle")) then {
                (driver _x) disableAI "MOVE";
                
                _x addEventHandler ["GetOut", {            
                    private ["_vehicle", "_position", "_unit"];
                    
                    PARAMS_3(_vehicle, _position, _unit);
                    
                    if (_position == "driver") then {
                        _unit moveInDriver _vehicle;
                    };
                }];
            };
        } forEach _objects;

        _group allowFleeing 0;
        
        [_group, _position] call bis_fnc_taskDefend;
    };
    
    case "enemy": {
        _group = createGroup east;
        
        {
            _units = _units + ([_x, _group] call BIS_fnc_spawnCrew);
        } forEach _objects;
    };
};

_units