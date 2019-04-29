#include "x_macros.sqf"
private ["_unit", "_position", "_name", "_checks", "_minimum", "_near", "_maximum", "_vehicle", "_aircraft", "_crew", "_pilot", "_helper"];

PARAMS_2(_unit, _position);

if (hasInterface) then {
    _name = "Air taxi";
    _checks = [
        [
            _name,
            _position,
            player,
            [GVAR(air_taxi_distance_player), "within", "of your location"]
        ] call FUNC(helper,distanceFrom),
        
        [
            _name,
            _position,
            markerPos QGVAR(base_marker),
            [GVAR(air_taxi_distance_base), "in excess of", "from base"]
        ] call FUNC(helper,distanceFrom),
        
        [
            _name,
            _position,
            player,
            GVAR(air_taxi_distance_enemy)
        ] call FUNC(helper,nearEnemies),
        
        [
            _name
        ] call FUNC(helper,inVehicle),
        
        [
            _name,
            player getVariable QGVAR(air_taxi_cooldown)
        ] call FUNC(helper,timeExceeded),
        
        [
            _name,
            QGVAR(air_taxi_progress)
        ] call FUNC(helper,inProgress)
    ];
    
    if (false in _checks) exitWith {};
    
    X_JIPH setVariable [QGVAR(air_taxi_call), true, true];
    player setVariable [QGVAR(air_taxi_cooldown), time + GVAR(air_taxi_time_cooldown)];
    
    if (!isServer) then {
        airTaxi = _this;
        publicVariableServer "airTaxi";
    };
};

if (isServer && {X_JIPH getVariable QGVAR(air_taxi_call)}) then {
    X_JIPH setVariable [QGVAR(air_taxi_call), false, true];
    X_JIPH setVariable [QGVAR(air_taxi_progress), true, true];
    
    if (!isNil QMODULE(crossroad)) then {
        [_unit, _position, "air taxi"] call FUNC(crossroad,request);
    };
    
    GVAR(air_taxi_type_smoke) createVehicle _position;
    
    _vehicle = [_position, GVAR(air_taxi_type_aircraft), GVAR(air_taxi_distance_spawn)] call FUNC(server,spawnVehicle);

    _aircraft = _vehicle select 0;
    _crew = _vehicle select 1;
    _pilot = driver _aircraft;
    
    {
        _x addEventHandler ["HandleDamage", {0}];
    } forEach _crew;
    
    _aircraft flyInHeight 80;
    _aircraft lockDriver true;
    _aircraft allowCrewInImmobile true;
    
    _pilot setSkill 1;
    _pilot doMove _position;
    
    (group _pilot) setBehaviour "CARELESS";
    
    while {alive _aircraft && {canMove _aircraft}} do {
        _helper = "HeliHEmpty" createVehicleLocal _position;
        
        if (unitReady _pilot) exitWith {
            sleep 0.1;
            _aircraft land "LAND";
            
            while {alive _aircraft && {canMove _aircraft}} do {
                if (speed _aircraft > -1 && {speed _aircraft < 0.01} && {(position _aircraft) select 2 < 2}) exitWith {
                    deleteVehicle _helper;
                    
                    if (!isNil QMODULE(crossroad)) then {
                        GVAR(crossroad) kbTell [GVAR(crossroad2), "HQ", "CrossroadDepart", ["1", {}, "air taxi", []], ["2", {}, format ["%1 second(s)", GVAR(air_taxi_time_wait)], []], true];
                    };
                    
                    sleep GVAR(air_taxi_time_wait);
                    
                    _pilot doMove (markerPos QGVAR(air_taxi));
                    
                    while {alive _aircraft && {canMove _aircraft}} do {
                        if (unitReady _pilot) exitWith {
                            sleep 0.1;
                            _aircraft land "LAND";

                            while {alive _aircraft && {canMove _aircraft}} do {
                                if (speed _aircraft > -1 && {speed _aircraft < 0.01} && {(position _aircraft) select 2 < 2}) exitWith {
                                    {
                                        if (isPlayer _x) then {
                                            moveOut _x;
                                        };
                                    } forEach crew _aircraft;

                                    _aircraft lock true;
                                    
                                    [_aircraft] call FUNC(server,exitMap);
                                };
                                
                                sleep 2;
                            };
                        };
                        
                        sleep 2;
                    };
                };
                
                sleep 2;
            };
        };
        
        sleep 2;
    };

    if (!canMove _aircraft) then {
        [nil, nil, rSpawn, [_aircraft], {(_this select 0) vehicleChat "We've been hit! Critical damage! Eject now!"}] call RE;
        
        sleep 15;
        
        if (alive _aircraft) then {
            {
                deleteVehicle _x;
            } forEach _crew;
            
            _aircraft setDamage 1;
        };
    };

    if (!isNil "_helper") then {
        deleteVehicle _helper;
    };
    
    X_JIPH setVariable [QGVAR(air_taxi_progress), false, true];
};