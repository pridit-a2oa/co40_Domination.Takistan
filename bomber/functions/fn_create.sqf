#define THIS_MODULE bomber
#include "x_macros.sqf"

if (count (call FUNC(common,players)) < 1) exitWith {};

gameLogic setVariable [QGVAR(bomber), true, true];

0 spawn {
    private ["_road", "_direction", "_vehicle", "_car", "_crew", "_driver"];
    
    _road = GVAR(bomber_type_roads) call BIS_fnc_selectRandom;
    _direction = [position _road, (markerPos QGVAR(bomber))] call BIS_fnc_dirTo;
    _vehicle = [position _road, GVAR(bomber_type_vehicles) call BIS_fnc_selectRandom, 5, 0, civilian, _direction] call FUNC(server,spawnVehicle);
    
    _car = _vehicle select 0;
    _crew = _vehicle select 1;
    _driver = driver _car;
    
    {
        _x setCaptive true;
    } forEach _crew;
    
    _car lock true;
    _car allowCrewInImmobile true;
    _car setVariable [QGVAR(bomber), true, true];
    
    _driver disableAI "FSM";
    _driver setBehaviour "CARELESS";
    _driver doMove (markerPos QGVAR(bomber));
    
    while {count (call FUNC(common,players)) > 0 && {[_driver, _car] call FUNC(THIS_MODULE,alive)}} do {      
        waitUntil {sleep 0.5; _car distance (markerPos QGVAR(bomber)) < 300};
        
        if (true) exitWith {
            if !(isNil QMODULE(conversation)) then {
                [
                    [GVAR(crossroad), GVAR(crossroad2)],
                    [QUOTE(THIS_MODULE), "Approach"]
                ] call FUNC(conversation,radio);
            };
            
            [
                nil,
                _car,
                "per",
                rAddAction,
                "Intel" call FUNC(common,BlueText),
                __function(intel),
                [],
                10,
                false,
                true,
                "",
                "alive _target && {canMove _target} && {alive (driver _target)} && {_target getVariable 'd_bomber'}"
            ] call RE;
            
            if (GVAR(bomber_chance_music) > floor (random 100)) then {
                [_driver, _car] spawn {
                    private ["_driver", "_car"];
                    
                    PARAMS_2(_driver, _car);
                    
                    while {_this call FUNC(THIS_MODULE,alive)} do {
                        if ({_x distance _car < 1000} count (call FUNC(common,players)) > 0) then {
                            [true, "say3D", [_car, "RadioMusic_56s", 0]] call FUNC(network,mp);
                        };
                        
                        sleep 60;
                    };
                };
            };
            
            while {count (call FUNC(common,players)) > 0 && {[_driver, _car] call FUNC(THIS_MODULE,alive)}} do {
                _distance = _car distance (markerPos QGVAR(bomber));
                
                if (_distance < 50 && {_car getVariable QGVAR(bomber)}) then {
                    gameLogic action ["useWeapon", _car, (driver _car), 0];
                    
                    sleep 15 + (random 10);
                    
                    _driver disableAI "MOVE";
                };
                
                sleep 2;
            };
        };
        
        sleep 2;
    };
    
    if (isNull _car) exitWith {};
    
    if (alive _driver) then {
        _driver setDamage 1;
    };
    
    _car setDamage 1;
    
    sleep 20;
    
    [_car] call FUNC(THIS_MODULE,remove);
    
    gameLogic setVariable [QGVAR(bomber), false, true];
};