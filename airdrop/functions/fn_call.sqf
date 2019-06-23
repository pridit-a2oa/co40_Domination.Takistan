#define THIS_MODULE airdrop
#include "x_macros.sqf"
private ["_unit", "_position", "_drop", "_name", "_checks", "_vehicle", "_aircraft", "_crew", "_pilot", "_group", "_load"];

PARAMS_3(_unit, _position, _drop);

if (isNil "_drop") then {
    _drop = (player getVariable QGVAR(airdrop_type)) select 1;
};

if (hasInterface) then {
    _name = "Airdrop";
    _checks = [
        [
            _name,
            QGVAR(airdrop_progress)
        ] call FUNC(helper,inProgress),
        
        [
            [_name, "called"],
            player getVariable QGVAR(airdrop_cooldown)
        ] call FUNC(helper,timeExceeded),
        
        [
            [_name, "called"],
            _position,
            player,
            [GVAR(airdrop_distance_player), "within", "of your location"]
        ] call FUNC(helper,distanceFrom),
        
        [
            [_name, "called"]
        ] call FUNC(helper,inVehicle)
    ];
    
    {
        if (typeName _x == "STRING") exitWith {
            hint _x;
        };
    } forEach _checks;

    if ({str (_x) == "true"} count _checks < count _checks) exitWith {};
    
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
    
    _vehicle = [_position, GVAR(airdrop_type_aircraft), GVAR(airdrop_distance_spawn), 400, west] call FUNC(server,spawnVehicle);

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
            _load = [_aircraft, _position, _drop, ""] call FUNC(common,paradrop);
            
            __addDead(_load);
            
            if (!isNil QMODULE(vehicle_respawn) && {_load isKindOf "AllVehicles"}) then {
                _load setVariable [QGVAR(respawnable), false, true];
            };
            
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