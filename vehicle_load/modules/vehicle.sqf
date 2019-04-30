/**
 * Vehicle Load Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_load
#include "x_macros.sqf"
private ["_vehicle", "_loaded", "_load", "_action", "_actions"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_load_type_aircraft) != typeOf _vehicle) exitWith {};

if (isNil {_vehicle getVariable QGVAR(loaded)}) then {    
    _vehicle setVariable [QGVAR(loaded), [], true];
    _vehicle setVariable [QGVAR(actions), [], true];
};

if (hasInterface) then {
    while {alive _vehicle} do {
        _loaded = _vehicle getVariable QGVAR(loaded);
        _actions = _vehicle getVariable QGVAR(actions);
        
        if (count _loaded > 0) then {
            for "_i" from 1 to (count _loaded) do {
                _load = _loaded select (_i - 1);
                _action = _actions select (_i - 1);
                
                if (isNil "_action") then {
                    _actions set [
                        (_i - 1),
                        _vehicle addAction [format ["Unload %1", getText (configFile >> "cfgVehicles" >> (_load select 0) >> 'displayName')] call FUNC(common,OliveText), FUNCTION(THIS_MODULE,unload), _load, 10, false, true, "", "player == driver _target"]
                    ];
                    
                    _vehicle setVariable [QGVAR(actions), _actions];
                };
            };
        };
        
        sleep 5;
    };
};