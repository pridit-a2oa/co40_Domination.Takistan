#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_type"];

PARAMS_2(_target, _type);

switch (_type) do {
    case "camp": {
        private ["_camps", "_compositions", "_composition", "_position", "_roads", "_near", "_camp", "_objects", "_group", "_trigger"];

        _camps = 0;

        _compositions = GVAR(mission_main_type_camps);
        
        while {_camps != GVAR(mission_main_amount_camps)} do {
            _composition = [0, _compositions] call FUNC(common,arrayValues);
            _position = [position _target, 20, GVAR(mission_main_radius_zone) / 2, 8, 0, 0.5, 0] call FUNC(common,safePos);
            _roads = _position nearRoads 70;
            _near = nearestObjects [_position, ["FlagCarrierTakistanKingdom_EP1"], 150];
            
            if (count _near < 1) then {
                _camp = _composition call BIS_fnc_selectRandom;

                _objects = [
                    _position,
                    if (count _roads > 0) then {([_roads select 0, _position] call BIS_fnc_dirTo) - 90} else {random 360},
                    _camp,
                    [
                        ["BMP2_TK_EP1", "Igla_AA_pod_TK_EP1"],
                        ["FoldChair"],
                        ["FoldTable"],
                        ["Fort_Crate_wood"],
                        ["Garbage_can"],
                        ["Land_BagFenceEnd"],
                        ["Land_BagFenceLong", "Land_fort_bagfence_long"],
                        ["Land_BagFenceShort"],
                        ["Land_Ind_BoardsPack2"],
                        ["Paleta2"],
                        ["TKBasicWeapons_EP1"]
                    ]
                ] call FUNC(server,objectMapper);
                
                _group = [
                    _position,
                    east,
                    (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")
                ] call FUNC(server,spawnGroup);
                
                if (!isNil QMODULE(unit)) then {
                    [_group, _position] call FUNC(unit,defend);
                };

                if (([1, _compositions] call FUNC(common,arrayValues)) select (_composition find _camp)) then {
                    _compositions = [_compositions, _composition find _camp] call FUNC(common,deleteAt);
                };
                
                _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + _objects + (units _group)];
                _target setVariable [QGVAR(units), (_target getVariable QGVAR(units)) + (units _group)];
                
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
            _trigger setTriggerActivation ["WEST", "PRESENT", false];
            _trigger setTriggerTimeout [GVAR(mission_main_time_capture), GVAR(mission_main_time_capture), GVAR(mission_main_time_capture), true];
            _trigger setTriggerStatements [
                "[thisTrigger getVariable ""d_flag"", {isPlayer _x && {alive _x} && {!(_x isKindOf ""Air"")} && {!(_x getVariable ""d_unconscious"")}} count thisList] call d_fnc_mission_main_valid",
                "[thisTrigger getVariable ""d_flag"", thisTrigger, thisList] spawn d_fnc_mission_main_capture",
                ""
            ];
            
            if (!isNil QMODULE(3d)) then {
                [true, "execVM", [
                    [_x, "Capture" call FUNC(common,RedText), [1, GVAR(3d_distance_visible)], false, true],
                    FUNCTION(3d,create)
                ]] call FUNC(network,mp);
            };
            
            [true, "spawn", [[_x], {
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
                        "",
                        [0.5, 0.5]
                    ] call FUNC(marker,create);
                };
            }]] call FUNC(network,mp);
            
            _target setVariable [QGVAR(camps), (_target getVariable QGVAR(camps)) + [_x], true];
            
            sleep 0.5;
        } forEach (nearestObjects [position _target, ["FlagCarrierTakistanKingdom_EP1"], GVAR(mission_main_radius_zone)]);
        
        {
            _x addEventHandler ["HandleDamage", {0}];
            
            [true, "enableSimulation", [_x, false]] call FUNC(network,mp);
        } forEach (nearestObjects [position _target, ["Land_tent_east"], GVAR(mission_main_radius_zone)]);
    };
    
    case "radio": {
        private ["_position", "_near", "_radio"];

        while {count (_target getVariable QGVAR(radios)) != GVAR(mission_main_amount_radios)} do {
            _position = [position _target, 50, GVAR(mission_main_radius_zone) / 1.8, 3, 0, 0.5, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, [GVAR(mission_main_type_radio), "FlagCarrierTakistanKingdom_EP1"], 150];
            
            if (count _near < 1) then {
                _radio = ([_position, random 360, GVAR(mission_main_type_radio), east] call BIS_fnc_spawnVehicle) select 0;
                _radio setPos _position;
                
                _radio setVariable [QGVAR(id), [_radio] call FUNC(server,objectId), true];
                _radio setVariable [QGVAR(target), _target];

                [true, "execVM", [[_radio], __function(protect)]] call FUNC(network,mp);
                
                _radio addEventHandler ["Killed", {
                    private ["_unit", "_target"];
                    
                    PARAMS_1(_unit);
                    
                    _target = _unit getVariable QGVAR(target);
                    
                    if (!isNil QMODULE(marker)) then {
                        [format ["radio_%1", _unit getVariable QGVAR(id)]] call FUNC(marker,delete);
                    };
                }];
                
                [true, "spawn", [[_radio, _position], {
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
                            "",
                            [0.7, 0.9]
                        ] call FUNC(marker,create);
                    };
                }]] call FUNC(network,mp);
                
                _target setVariable [QGVAR(radios), (_target getVariable QGVAR(radios)) + [_radio], true];
                _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + [_radio]];
            };
            
            sleep 0.5;
        };
    };
    
    case "composition": {
        private ["_position", "_objects", "_group"];

        {
            for "_i" from 1 to (_x select 1) do {
                if (_x select 2 < floor (random 100)) exitWith {};

                _position = [position _target, 20, GVAR(mission_main_radius_zone) / 1.5, 5, 0, 0.7, 0] call FUNC(common,safePos);
                
                _objects = [
                    _position,
                    random 360,
                    _x select 0,
                    [
                        ["TKLaunchers_EP1"]
                    ]
                ] call FUNC(server,objectMapper);
                
                _group = [
                    _position,
                    east,
                    (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")
                ] call FUNC(server,spawnGroup);
                
                if (!isNil QMODULE(unit)) then {
                    [_group, _position] call FUNC(unit,defend);
                };
                
                _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + _objects + (units _group)];
                _target setVariable [QGVAR(units), (_target getVariable QGVAR(units)) + (units _group)];
            };
        } forEach GVAR(mission_main_type_compositions);
    };
    
    case "optional": {
        private ["_objective", "_goal", "_type", "_position", "_entity", "_fort"];

        _objective = GVAR(mission_main_type_optional) call BIS_fnc_selectRandom;
        
        _goal = _objective select 0;
        _type = _objective select 1;
        
        _position = [position _target, 10, GVAR(mission_main_radius_zone) / 2, 5, 0, 0.5, 0] call FUNC(common,safePos);
        
        switch (_type select 0) do {
            case "object": {
                _entity = ([_position, random 360, _type select 1, east] call BIS_fnc_spawnVehicle) select 0;

                [true, "execVM", [[_entity], __function(protect)]] call FUNC(network,mp);

                _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + [_entity]];
            };
            
            case "unit": {
                _fort = createVehicle ["CampEast_EP1", [_position select 0, _position select 1, -30], [], 0, "CAN_COLLIDE"];
                _fort setDir (random 360);
                _fort setPos [_position select 0, _position select 1, 0];
                _fort setVectorUp (surfaceNormal _position);

                _entity = (createGroup east) createUnit [_type select 1, _position, [], 0, "FORM"];
                _entity setPos [_position select 0, _position select 1, 0];
                _entity setVectorUp (surfaceNormal _position);

                _target setVariable [QGVAR(cleanup), (_target getVariable QGVAR(cleanup)) + [_fort]];
                _target setVariable [QGVAR(units), (_target getVariable QGVAR(units)) + [_entity]];
            };
        };
        
        if (!isNil QMODULE(task)) then {
            private ["_action", "_task"];

            _action = if (_type select 0 == "unit") then {"Kill"} else {"Destroy"};
            
            _task = [
                _goal + str ((position _entity) select 0),
                "",
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
            
            [true, "execVM", [_task, FUNCTION(task,create)]] call FUNC(network,mp);
            
            _entity addEventHandler ["Killed", {
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
                
                if ((_unit getVariable QGVAR(task)) select 3 == "Created" && {taskState _task in ["Created", "Assigned"]}) then {
                    _task setTaskState "Succeeded";
                    
                    [_task, "succeeded"] call FUNC(task,hint);
                };
            }];
        };
    };
};