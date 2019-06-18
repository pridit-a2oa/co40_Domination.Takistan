#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_type", "_position", "_antennas", "_near", "_camps", "_camp"];

PARAMS_2(_target, _type);

switch (_type) do {
    case "camp": {
        _camps = 0;

        while {_camps != GVAR(mission_main_amount_camps)} do {
            _position = [position _target, 20, GVAR(mission_main_radius_zone) / 1.5, 10, 0, 0.5, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, ["Land_tent_east"], 100];
            
            if (count _near < 1) then {
                _camp = [_position, random 360, GVAR(mission_main_type_camp)] call FUNC(common,objectMapper);
                
                {
                    _x addEventHandler ["HandleDamage", {0}];
                    
                    if (typeOf _x == "FlagCarrierTakistanKingdom_EP1") then {
                        _x setFlagTexture "\ca\ca_e\data\flag_tka_co.paa";
                        _x setVariable [QGVAR(target), _target];
                        
                        _trigger = createTrigger ["EmptyDetector", position _x];
                        _trigger setVariable [QGVAR(flag), _x];
                        _trigger setTriggerArea [GVAR(mission_main_distance_camp), GVAR(mission_main_distance_camp), 0, false];
                        _trigger setTriggerActivation ["WEST", "PRESENT", true];
                        _trigger setTriggerStatements [
                            "true",
                            "[thisTrigger getVariable ""d_flag""] spawn d_fnc_mission_main_capture",
                            "3 cutRsc [""Default"", ""PLAIN""];"
                        ];
                        
                        [nil, nil, rSpawn, [_x], {
                            private ["_flag"];
                            
                            PARAMS_1(_flag);
                            
                            if (!isNil QMODULE(marker)) then {
                                [
                                    format ["camp_%1", str (position _flag)],
                                    position _flag,
                                    "Strongpoint",
                                    "",
                                    "ColorWhite",
                                    1,
                                    "ICON",
                                    [0.5, 0.5]
                                ] call FUNC(marker,create);
                            };
                        }] call RE;
                        
                        // player setPos (position _x);
                    };

                    [nil, _x, "per", rEnableSimulation, false];
                } forEach _camp;

                _camps = _camps + 1;
            };

            sleep 0.5;
        };
        
        _target setVariable [QGVAR(camps), _camps];
    };
    
    case "radio": {
        _antennas = 0;
        
        while {_antennas != GVAR(mission_main_amount_antennas)} do {
            _position = [position _target, 50, GVAR(mission_main_radius_zone) / 1.5, 2, 0, 0.3, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, [GVAR(mission_main_type_antenna)], 100];
            
            if (count _near < 1) then {
                _antenna = GVAR(mission_main_type_antenna) createVehicle _position;
                _antenna setPos _position;
                _antenna setVariable [QGVAR(target), _target];
                
                _antenna addEventHandler ["killed", {
                    private ["_unit", "_target"];
                    
                    PARAMS_1(_unit);
                    
                    _target = _unit getVariable QGVAR(target);
                    _target setVariable [QGVAR(antennas), (_target getVariable QGVAR(antennas)) - 1];
                    
                    if (!isNil QMODULE(marker)) then {
                        [format ["antenna_%1", str (position _unit)]] call FUNC(marker,delete);
                    };
                }];

                [nil, nil, rSpawn, [_antenna], {
                    private ["_antenna"];
                    
                    PARAMS_1(_antenna);
                    
                    if (!isNil QMODULE(marker)) then {
                        [
                            format ["antenna_%1", str (position _antenna)],
                            position _antenna,
                            "FOB",
                            "",
                            "ColorWhite",
                            1,
                            "ICON",
                            [0.7, 0.9]
                        ] call FUNC(marker,create);
                    };
                }] call RE;
                
                _antennas = _antennas + 1;
            };
            
            sleep 0.5;
        };
        
        _target setVariable [QGVAR(antennas), _antennas];
    };
    
    case "optional": {
        _objective = GVAR(mission_main_type_optional) call BIS_fnc_selectRandom;
        
        _goal = _objective select 0;
        _type = _objective select 1;
        
        _position = [position _target, 10, GVAR(mission_main_radius_zone) / 2, 5, 0, 0.3, 0] call FUNC(common,safePos);
        
        _entity = switch (_type select 0) do {
            case "object": {
                createVehicle [_type select 1, _position, [], 0, "NONE"];
            };
            
            case "unit": {
                (createGroup east) createUnit [_type select 1, _position, [], 0, "FORM"];
            };
        };
        
        _entity setVariable [QGVAR(task), _goal + str ((position _entity) select 0), true];
        
        [nil, nil, rSpawn, [_type, _goal, _entity, _target], {
            private ["_type", "_goal", "_entity", "_target"];
            
            PARAMS_4(_type, _goal, _entity, _target);
            
            _action = if (_type select 0 == "unit") then {"Kill"} else {"Destroy"};
            
            if (!isNil QMODULE(task)) then {
                _title = format ["> Optional: %1 %2", _action, _goal];
                _description = format ["%1 %2", _action, _goal];

                _task = [
                    _entity getVariable QGVAR(task),
                    position _entity,
                    [_description, _title, _action],
                    "Created",
                    _target getVariable "name"
                ] call FUNC(task,create);
                
                _target setVariable [QGVAR(tasks), (_target getVariable QGVAR(tasks)) + [_task]];
            };
        }] call RE;
        
        if (!isNil QMODULE(task)) then {
            _entity addEventHandler ["killed", {
                private ["_unit", "_task"];
                
                PARAMS_1(_unit);
                
                _task = _unit getVariable QGVAR(task);
                
                [_task, "Succeeded"] call FUNC(task,state);
            }];
            
            _entity addMPEventHandler ["MPKilled", {
                private ["_unit", "_task"];
                
                PARAMS_1(_unit);
                
                _task = [_unit getVariable QGVAR(task)] call FUNC(task,get);
                _task setTaskState "Succeeded";
                
                [_task, "succeeded"] call FUNC(task,hint);
            }];
        };
        
        _entity spawn {
            sleep 10;
            
            player setPos (position _this);
        };
    };
};