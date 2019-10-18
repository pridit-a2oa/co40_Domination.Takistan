#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle", "_type", "_state"];

PARAMS_3(_vehicle, _type, _state);

switch (_state) do {
    case true: {
        _position = position _vehicle;
        _city = nearestLocation [_position, "nameCity"];

        _checks = [
            [
                [[typeOf _vehicle] call FUNC(vehicle,name), "deployed"],
                _position,
                markerPos QGVAR(base_south),
                [GVAR(vehicle_deploy_distance_base), "in excess of", "from base"]
            ] call FUNC(helper,distanceFrom),
            
            [
                [[typeOf _vehicle] call FUNC(vehicle,name), "deployed"],
                _vehicle
            ] call FUNC(helper,isOccupied)
        ];

        {
            if (typeName _x == "STRING") exitWith {
                hint _x;
            };
        } forEach _checks;

        if ({str (_x) == "true"} count _checks < count _checks) exitWith {};
        
        _vehicle setVariable [QGVAR(deployed), true, true];

        [_vehicle, "lock", true] call FUNC(network,mp);
        [_vehicle, "engineOn", false] call FUNC(network,mp);
        
        if (!isNil format ["d_mdl_vehicle_%1", _type]) then {
            [_vehicle, true] call (call compile format ["d_fnc_vehicle_%1_deploy", _type]);
        };

        if (!isNil QMODULE(vehicle_marker)) then {
            [true, "execVM", [[_vehicle, true], __submoduleRE(vehicle_marker)]] call FUNC(network,mp);
        };

        if (!isNil QMODULE(crossroad) && call FUNC(common,time) > player getVariable QGVAR(cooldown)) then {    
            [player, "kbTell", [
                GVAR(crossroad),
                "vehicle_deploy",
                "Deployed",
                ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
                ["2", {}, toUpper _type, []],
                ["3", {}, text (_city), []],
                true
            ]] call FUNC(network,mp);
            
            player setVariable [QGVAR(cooldown), call FUNC(common,time) + GVAR(crossroad_time_cooldown)];
        };
    };
    
    case false: {
        _vehicle setVariable [QGVAR(deployed), false, true];
        
        [_vehicle, "lock", false] call FUNC(network,mp);
        
        if (!isNil format ["d_mdl_vehicle_%1", _type]) then {
            [_vehicle, false] call (call compile format ["d_fnc_vehicle_%1_deploy", _type]);
        };
        
        if (!isNil QMODULE(vehicle_marker)) then {
            [true, "execVM", [[_vehicle, false], __submoduleRE(vehicle_marker)]] call FUNC(network,mp);
        };
    };
};