/**
 * Vehicle Deploy Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (typeName ([_vehicle] call FUNC(THIS_MODULE,type)) == "SCALAR") exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(deployed), [false, ""], true];
    
    _vehicle setVariable [QGVAR(cleanup), []];
    _vehicle setVariable [QGVAR(deploy_cooldown), 0];
    _vehicle setVariable [QGVAR(enable_simulation), true, true];
    
    _vehicle addEventHandler ["killed", {
        private ["_vehicle"];
        
        PARAMS_1(_vehicle);
        
        _deployed = _vehicle getVariable QGVAR(deployed);
        
        if (_deployed select 0) then {
            [_vehicle, _deployed select 1, false] call FUNC(THIS_MODULE,deploy);
            
            if (!isNil QMODULE(crossroad)) then {
                [GVAR(crossroad), "kbTell", [
                    GVAR(crossroad2),
                    "vehicle_deploy",
                    "Destroyed",
                    ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
                    true
                ]] call FUNC(network,mp);
            };
        };
    }];
};