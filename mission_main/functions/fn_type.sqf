#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_type", "_position", "_radios", "_near", "_camps", "_camp"];

PARAMS_2(_target, _type);

switch (_type) do {
    case "camp": {
        _camps = 0;
        
        while {_camps != GVAR(mission_main_amount_camps)} do {
            _position = [position _target, 20, GVAR(mission_main_radius_zone) / 1.5, 10, 0, 0.5, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, ["Land_tent_east"], 100];
            
            if (count _near < 1) then {
                _group = [_position, east, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")] call FUNC(server,spawnGroup);
                
                [_group, _position] call bis_fnc_taskDefend;
                
                _objects = [[east, _target], _position, random 360, GVAR(mission_main_type_camp)] spawn FUNC(server,objectMapper);
                
                waitUntil {sleep 1; scriptDone _objects};
                
                _camps = _camps + 1;
            };

            sleep 0.5;
        };
        
        {
            _x addEventHandler ["HandleDamage", {0}];
            
            _x setFlagTexture "\ca\ca_e\data\flag_tka_co.paa";
            
            _x setVariable [QGVAR(time), 0, true];
            _x setVariable [QGVAR(capturing), false];
            
            _x setVariable [QGVAR(id), [_x] call FUNC(server,objectId), true];
            _x setVariable [QGVAR(target), _target];
            
            _trigger = createTrigger ["EmptyDetector", position _x];
            _trigger setVariable [QGVAR(flag), _x];
            _trigger setTriggerArea [GVAR(mission_main_distance_camp) - 1, GVAR(mission_main_distance_camp) - 1, 0, false];
            _trigger setTriggerActivation ["WEST", "PRESENT", true];
            _trigger setTriggerStatements [
                "{isPlayer _x} count thisList > 0 && {!((thisTrigger getVariable ""d_flag"") getVariable 'd_capturing')}",
                "[thisTrigger getVariable ""d_flag"", thisTrigger] spawn d_fnc_mission_main_capture",
                ""
            ];
            
            if (!isNil QMODULE(3d)) then {
                [nil, player, "per", rExecVM, FUNCTION(3d,create), _x, "Capture" call FUNC(common,RedText), [1, GVAR(3d_distance_visible)], false, true] call RE;
            };
            
            [nil, nil, rSpawn, [_x], {
                private ["_flag"];
                
                PARAMS_1(_flag);
                
                if (!isNil QMODULE(marker)) then {
                    [
                        format ["camp_%1", _flag getVariable QGVAR(id)],
                        position _flag,
                        "Strongpoint",
                        "",
                        "ColorBlack",
                        0.9,
                        "ICON",
                        [0.5, 0.5]
                    ] call FUNC(marker,create);
                };
            }] call RE;
            
            sleep 0.5;
        } forEach (nearestObjects [position _target, ["FlagCarrierTakistanKingdom_EP1"], GVAR(mission_main_radius_zone)]);
        
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (nearestObjects [position _target, ["Land_tent_east"], GVAR(mission_main_radius_zone)]);
        
        _target setVariable [QGVAR(camps), _camps];
    };
    
    case "radio": {
        _radios = 0;
        
        while {_radios != GVAR(mission_main_amount_radios)} do {
            _position = [position _target, 50, GVAR(mission_main_radius_zone) / 1.5, 2, 0, 0.3, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, [GVAR(mission_main_type_radio)], 100];
            
            if (count _near < 1) then {
                _radio = ([_position, random 360, GVAR(mission_main_type_radio), east] call BIS_fnc_spawnVehicle) select 0;
                _radio setPos _position;
                
                _radio setVariable [QGVAR(id), [_radio] call FUNC(server,objectId), true];
                _radio setVariable [QGVAR(target), _target];
                
                if (!isNil QMODULE(3d)) then {
                    [nil, player, "per", rExecVM, FUNCTION(3d,create), _radio, "Destroy" call FUNC(common,RedText), [1, GVAR(3d_distance_visible)], true] call RE;
                };
                
                _radio addEventHandler ["killed", {
                    private ["_unit", "_target"];
                    
                    PARAMS_1(_unit);
                    
                    _target = _unit getVariable QGVAR(target);
                    _target setVariable [QGVAR(radios), (_target getVariable QGVAR(radios)) - 1];
                    
                    if (!isNil QMODULE(marker)) then {
                        [format ["radio_%1", _unit getVariable QGVAR(id)]] call FUNC(marker,delete);
                    };
                }];

                [nil, nil, rSpawn, [_radio, _position], {
                    private ["_radio", "_position"];
                    
                    PARAMS_2(_radio, _position);
                    
                    if (!isNil QMODULE(marker)) then {
                        [
                            format ["radio_%1", _radio getVariable QGVAR(id)],
                            _position,
                            "FOB",
                            "",
                            "ColorBlack",
                            0.9,
                            "ICON",
                            [0.7, 0.9]
                        ] call FUNC(marker,create);
                    };
                }] call RE;
                
                _radios = _radios + 1;
            };
            
            sleep 0.5;
        };
        
        _target setVariable [QGVAR(radios), _radios];
    };
    
    case "composition": {
        {
            for "_i" from 1 to (_x select 1) do {
                _position = [position _target, 20, GVAR(mission_main_radius_zone) / 1.2, 10, 0, 0.3, 0] call FUNC(common,safePos);
                
                [[east, _target], _position, random 360, _x select 0] spawn FUNC(server,objectMapper);
                
                _group = [_position, east, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")] call FUNC(server,spawnGroup);
                
                [_group, _position] call bis_fnc_taskDefend;
            };
        } forEach GVAR(mission_main_type_compositions);
    };
    
    case "optional": {
        _objective = GVAR(mission_main_type_optional) call BIS_fnc_selectRandom;
        
        _goal = _objective select 0;
        _type = _objective select 1;
        
        _position = [position _target, 10, GVAR(mission_main_radius_zone) / 2, 5, 0, 0.3, 0] call FUNC(common,safePos);
        
        _entity = switch (_type select 0) do {
            case "object": {
                ([_position, random 360, _type select 1, east] call BIS_fnc_spawnVehicle) select 0;
            };
            
            case "unit": {
                (createGroup east) createUnit [_type select 1, _position, [], 0, "FORM"];
            };
        };
        
        _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + [_entity]];
        
        if (!isNil QMODULE(task)) then {
            _action = if (_type select 0 == "unit") then {"Kill"} else {"Destroy"};
            
            _task = [
                _goal + str ((position _entity) select 0),
                position _entity,
                [
                    format ["%1 %2", _action, _goal],
                    format ["> Optional: %1 %2", _action, _goal],
                    _action
                ],
                "Created",
                _target getVariable "name"
            ];
            
            _target setVariable [QGVAR(tasks), (_target getVariable QGVAR(tasks)) + [_task], true];
            
            _entity setVariable [QGVAR(task), _task, true];
        
            [nil, nil, rSpawn, [_task], {
                private ["_task"];
                
                PARAMS_1(_task);

                _task call FUNC(task,create);
            }] call RE;
            
            _entity addEventHandler ["killed", {
                private ["_unit", "_task"];
                
                PARAMS_1(_unit);
                
                _task = _unit getVariable QGVAR(task);
                
                if (_task select 3 == "Created") then {
                    [_task, "Succeeded"] call FUNC(task,state);
                };
            }];
            
            _entity addMPEventHandler ["MPKilled", {
                private ["_unit", "_task"];
                
                PARAMS_1(_unit);
                
                _task = [(_unit getVariable QGVAR(task)) select 0] call FUNC(task,get);
                
                if (taskState _task == "Created") then {
                    _task setTaskState "Succeeded";
                    
                    [_task, "succeeded"] call FUNC(task,hint);
                };
            }];
        };
    };
};