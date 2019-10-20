#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle", "_type", "_state"];

PARAMS_3(_vehicle, _type, _state);

switch (_state) do {
    case true: {
        _position = position _vehicle;
        _location = [_position] call FUNC(common,nearestLocation);
        
        if (hasInterface) then {
            _name = [typeOf _vehicle] call FUNC(vehicle,name);
            _checks = [
                [
                    [_name, "deployed"],
                    _position,
                    markerPos QGVAR(base_south),
                    [GVAR(vehicle_deploy_distance_base), "in excess of", "from base"]
                ] call FUNC(helper,distanceFrom),
                
                [
                    [_name, "deployed"],
                    _vehicle
                ] call FUNC(helper,isOccupied),
                
                [
                    [_name, "deployed"],
                    _vehicle getVariable QGVAR(deploy_cooldown)
                ] call FUNC(helper,timeExceeded)
            ];

            {
                if (typeName _x == "STRING") exitWith {
                    hint _x;
                };
            } forEach _checks;

            if ({str (_x) == "true"} count _checks < count _checks) exitWith {};
            
            _vehicle setVariable [QGVAR(deployed), true, true];
            
            if (!isNil QMODULE(crossroad) && call FUNC(common,time) > player getVariable QGVAR(cooldown)) then {    
                [player, "kbTell", [
                    GVAR(crossroad),
                    "vehicle_deploy",
                    "Deployed",
                    ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
                    ["2", {}, toUpper _type, []],
                    ["3", {}, text _location, []],
                    true
                ]] call FUNC(network,mp);
                
                player setVariable [QGVAR(cooldown), call FUNC(common,time) + GVAR(crossroad_time_cooldown)];
            };
            
            if !(isServer) then {
                [gameLogic, "execVM", [_this, __function(deploy)]] call FUNC(network,mp);
            };
        };
        
        if (isServer && {_vehicle getVariable QGVAR(deployed)}) then {
            _vehicle setVariable [QGVAR(deploy_cooldown), time + GVAR(vehicle_deploy_cooldown_deploy)];

            [_vehicle, "lock", true] call FUNC(network,mp);
            [_vehicle, "engineOn", false] call FUNC(network,mp);
            
            if (!isNil format ["d_mdl_vehicle_%1", _type]) then {
                [_vehicle, true] call compile preprocessFileLineNumbers format ["vehicle_%1\modules\%2.sqf", _type, QUOTE(THIS_MODULE)];
            };

            if (!isNil QMODULE(vehicle_marker)) then {
                [true, "execVM", [[_vehicle, true], __submoduleRE(vehicle_marker)]] call FUNC(network,mp);
            };
        };
    };
    
    case false: {
        if (hasInterface) then {
            _checks = [            
                [
                    [[typeOf _vehicle] call FUNC(vehicle,name), "undeployed"],
                    _vehicle getVariable QGVAR(deploy_cooldown)
                ] call FUNC(helper,timeExceeded)
            ];

            {
                if (typeName _x == "STRING") exitWith {
                    hint _x;
                };
            } forEach _checks;

            if ({str (_x) == "true"} count _checks < count _checks) exitWith {};
            
            _vehicle setVariable [QGVAR(deployed), false, true];
            
            if !(isServer) then {
                [gameLogic, "execVM", [_this, __function(deploy)]] call FUNC(network,mp);
            };
        };
        
        if (isServer && {!(_vehicle getVariable QGVAR(deployed))}) then {
            _vehicle setVariable [QGVAR(deploy_cooldown), time + GVAR(vehicle_deploy_cooldown_deploy)];
            
            [_vehicle, "lock", false] call FUNC(network,mp);
            
            if (!isNil format ["d_mdl_vehicle_%1", _type]) then {
                [_vehicle, false] call compile preprocessFileLineNumbers format ["vehicle_%1\modules\%2.sqf", _type, QUOTE(THIS_MODULE)];
            };
            
            if (!isNil QMODULE(vehicle_marker)) then {
                [true, "execVM", [[_vehicle, false], __submoduleRE(vehicle_marker)]] call FUNC(network,mp);
            };
        };
    };
};