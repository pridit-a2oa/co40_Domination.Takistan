#define THIS_MODULE airdrop
#include "x_macros.sqf"
private ["_unit", "_position", "_drop", "_vehicle", "_aircraft", "_crew", "_marker"];
PARAMS_3(_unit, _position, _drop);

if (hasInterface) then {
    X_JIPH setVariable [QGVAR(airdrop), true, true];
    
    if (!isServer) then {
        airdrop = _this;
        publicVariableServer "airdrop";
    };
};

if (isServer) then {
    if (!isNil QMODULE(crossroad)) then {
        [_unit, _position, "airdrop"] call FUNC(crossroad,request);
    };
    
    GVAR(airdrop_smoke) createVehicle _position;
    
    _vehicle = [_position, GVAR(airdrop_aircraft), GVAR(airdrop_aircraft_distance)] call FUNC(server,spawnVehicle);

    _aircraft = _vehicle select 0;
    _aircraft flyInHeight 200;

    _crew = _vehicle select 1;
    
    {
        _x setCaptive true;
    } forEach _crew;
    
    _pilot = driver _aircraft;
    _pilot setSkill 1;
    _pilot doMove ([_position, 100, (getDir _aircraft - 180)] call BIS_fnc_relPos);

    _group = group (driver _aircraft);

    while {alive _aircraft && {canMove _aircraft}} do {
        if (unitReady _pilot) exitWith {
            [_aircraft, _position, _drop] spawn FUNC(THIS_MODULE,drop);
            
            [_aircraft] call FUNC(server,exitMap);
        };
        
        sleep 1;
    };
};