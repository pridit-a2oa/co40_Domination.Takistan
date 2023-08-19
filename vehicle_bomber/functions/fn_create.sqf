#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"

if ([count (call FUNC(common,players)), 0] call BIS_fnc_areEqual) exitWith {};

gameLogic setVariable [QGVAR(bomber), true, true];

0 spawn {
    private ["_road", "_direction", "_vehicle", "_car", "_crew", "_driver"];
    
    _road = GVAR(vehicle_bomber_roads) call BIS_fnc_selectRandom;
    _direction = [position _road, (markerPos QGVAR(bomber))] call BIS_fnc_dirTo;
    _vehicle = [position _road, GVAR(vehicle_bomber_type_vehicles) call BIS_fnc_selectRandom, 5, 0, civilian, _direction] call FUNC(server,spawnVehicle);
    
    _car = _vehicle select 0;
    _crew = _vehicle select 1;
    _driver = driver _car;

    __addDead(_driver);
    
    {
        _x setCaptive true;
    } forEach _crew;
    
    _car lock true;
    _car allowCrewInImmobile true;
    _car setVariable [QGVAR(bomber), true, true];
    
    _driver disableAI "FSM";
    _driver setBehaviour "CARELESS";
    _driver doMove (markerPos QGVAR(bomber));

    _driver addEventHandler ["Killed", {
        private ["_unit", "_killer"];

        PARAMS_2(_unit, _killer);

        if !(isPlayer _killer) exitWith {};

        [_unit, _killer] spawn {
            private ["_unit", "_killer"];

            PARAMS_2(_unit, _killer);

            switch (side group _unit) do {
                case east: {
                    if (isNil QMODULE(reward)) exitWith {};
                    if !(alive (vehicle _unit)) exitWith {};
                    if !([_killer] call FUNC(common,ready)) exitWith {};

                    sleep 3;

                    [
                        _killer,
                        GVAR(vehicle_bomber_amount_score),
                        "protecting the base"
                    ] call FUNC(reward,score);
                };

                case civilian: {
                    _killer addScore -10;

                    [true, "systemChat", format [
                        "%1 has lost score for killing a civilian",
                        name _killer
                    ]] call FUNC(network,mp)
                };
            };
        };
    }];
        
    while {count (call FUNC(common,players)) > 0 && {[_car] call FUNC(THIS_MODULE,valid)}} do {      
        waitUntil {
            sleep 0.5;
            
            _car distance (markerPos QGVAR(bomber)) < 300
        };
        
        if (true) exitWith {
            if !(isNil QMODULE(conversation)) then {
                [
                    [GVAR(crossroad), GVAR(crossroad2)],
                    [QUOTE(THIS_MODULE), "Approach"]
                ] call FUNC(conversation,radio);
            };
            
            if (GVAR(vehicle_bomber_chance_music) > floor (random 100)) then {
                _car spawn {                    
                    while {[_this] call FUNC(THIS_MODULE,valid)} do {
                        if ({_x distance _this < 1000} count (call FUNC(common,players)) > 0) then {
                            [true, "say3D", [_this, "RadioMusic_56s", 0]] call FUNC(network,mp);
                        };
                        
                        sleep 60;
                    };
                };
            };
            
            while {count (call FUNC(common,players)) > 0 && {[_car] call FUNC(THIS_MODULE,valid)}} do {
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
    
    if (alive _car) then {
        _car setDamage 1;
    };
    
    sleep 20;
    
    [_car] call FUNC(THIS_MODULE,remove);
    
    gameLogic setVariable [QGVAR(bomber), false, true];
};