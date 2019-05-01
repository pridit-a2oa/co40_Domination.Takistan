#define THIS_MODULE airdrop
#include "x_macros.sqf"
private ["_unit", "_position", "_drop", "_name", "_checks", "_vehicle", "_aircraft", "_crew", "_marker"];

PARAMS_3(_unit, _position, _drop);

if (hasInterface) then {
    _name = "Airdrop";
    _checks = [
        [
            _name,
            _position,
            player,
            [GVAR(airdrop_distance_player), "within", "of your location"]
        ] call FUNC(helper,distanceFrom),
        
        [
            _name
        ] call FUNC(helper,inVehicle),
        
        [
            _name,
            player getVariable QGVAR(airdrop_cooldown)
        ] call FUNC(helper,timeExceeded),
        
        [
            _name,
            QGVAR(airdrop_progress)
        ] call FUNC(helper,inProgress)
    ];
    
    if (false in _checks) exitWith {};
    
    X_JIPH setVariable [QGVAR(airdrop_call), true, true];
    player setVariable [QGVAR(airdrop_cooldown), time + GVAR(airdrop_time_cooldown)];
    
    if (!isServer) then {
        airdrop = _this;
        publicVariableServer "airdrop";
    };
};

if (isServer && {X_JIPH getVariable QGVAR(airdrop_call)}) then {
    X_JIPH setVariable [QGVAR(airdrop_call), false, true];
    X_JIPH setVariable [QGVAR(airdrop_progress), true, true];
    
    if (!isNil QMODULE(crossroad)) then {
        [_unit, _position, "airdrop"] call FUNC(crossroad,request);
    };
    
    GVAR(airdrop_type_smoke) createVehicle _position;
    
    _vehicle = [_position, GVAR(airdrop_type_aircraft), GVAR(airdrop_distance_spawn)] call FUNC(server,spawnVehicle);

    _aircraft = _vehicle select 0;
    _crew = _vehicle select 1;
    _pilot = driver _aircraft;
    
    _aircraft flyInHeight 200;
    
    {
        _x setCaptive true;
    } forEach _crew;

    _pilot setSkill 1;
    _pilot doMove _position;

    _group = group (driver _aircraft);

    while {alive _aircraft && {canMove _aircraft}} do {
        if (_aircraft distance _position < 650) exitWith {
            [_aircraft, _position, _drop, ""] call FUNC(common,paradrop);
            
            while {alive _aircraft && {canMove _aircraft}} do {
                if (unitReady _pilot) exitWith {
                    [_aircraft] call FUNC(server,exitMap);
                };
                
                sleep 2;
            };
        };
        
        sleep 1;
    };
    
    X_JIPH setVariable [QGVAR(airdrop_progress), false, true];
};