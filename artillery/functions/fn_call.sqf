#define THIS_MODULE artillery
#include "x_macros.sqf"
private ["_unit", "_position", "_salvoes", "_name", "_checks", "_smoke", "_strike", "_shell"];

PARAMS_3(_unit, _position, _salvoes);

if (hasInterface) then {
    _name = "Artillery";
    _checks = [
        [
            _name,
            _position,
            WEST,
            GVAR(artillery_distance_friendly)
        ] call FUNC(helper,nearSide),
    
        [
            _name,
            _position,
            player,
            [player getVariable QGVAR(artillery_range), "within", "of your location"]
        ] call FUNC(helper,distanceFrom),
        
        [
            _name,
            _position,
            markerPos QGVAR(base_marker),
            [GVAR(artillery_distance_base), "in excess of", "from base"]
        ] call FUNC(helper,distanceFrom),
        
        [
            _name
        ] call FUNC(helper,inVehicle),
        
        [
            _name,
            player getVariable QGVAR(artillery_cooldown)
        ] call FUNC(helper,timeExceeded),
        
        [
            _name,
            QGVAR(artillery_progress)
        ] call FUNC(helper,inProgress)
    ];
    
    if (false in _checks) exitWith {};
    
    X_JIPH setVariable [QGVAR(artillery_call), true, true];
    player setVariable [QGVAR(artillery_cooldown), time + GVAR(artillery_time_cooldown)];
    
    if (!isServer) then {
        artillery = _this;
        publicVariableServer "artillery";
    };
};

if (isServer && {X_JIPH getVariable QGVAR(artillery_call)}) then {
    X_JIPH setVariable [QGVAR(artillery_call), false, true];
    X_JIPH setVariable [QGVAR(artillery_progress), true, true];
    
    if (!isNil QMODULE(crossroad)) then {
        [_unit, _position, format ["artillery strike, %1 salvo(es)", _salvoes]] call FUNC(crossroad,request);
    };
    
    _smoke = GVAR(artillery_type_smoke) createVehicle _position;
    
    sleep GVAR(artillery_time_wait);
    
    deleteVehicle _smoke;
    
    for "_i" from 1 to _salvoes do {
        for "_i" from 1 to GVAR(artillery_amount_shell) do {
            _strike = [_position, random 40, random 360] call BIS_fnc_relPos;
            
            [[_strike select 0, _strike select 1, 150]] spawn FUNC(THIS_MODULE,trail);
            
            sleep 1;
            
            _shell = createVehicle [GVAR(artillery_type_shell), _strike, [], 0, "NONE"];
            _shell setPos _strike;
            
            sleep 2;
        };
        
        sleep 6;
    };
    
    X_JIPH setVariable [QGVAR(artillery_progress), false, true];
};