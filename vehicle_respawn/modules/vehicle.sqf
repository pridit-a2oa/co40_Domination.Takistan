/**
 * Vehicle Respawn Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_respawn
#include "x_macros.sqf"
private ["_vehicle", "_type", "_position", "_direction", "_threshold", "_expiration", "_empty", "_dead", "_respawnable"];

PARAMS_1(_vehicle);

if ((markerPos QGVAR(base_south)) distance (_vehicle getVariable QGVAR(position)) >= GVAR(vehicle_respawn_distance_base)) exitWith {};

if (_vehicle isKindOf "Car" || {_vehicle isKindOf "Air"}) then {
    _respawnable = _vehicle getVariable QGVAR(respawnable);
    
    if (!isNil "_respawnable" && {!_respawnable}) exitWith {};
    
    while {true} do {
        _position = _vehicle getVariable QGVAR(position);
        _direction = _vehicle getVariable QGVAR(direction);
        _threshold = _vehicle getVariable QGVAR(threshold);
        _expiration = _vehicle getVariable QGVAR(expiration);
        
        if (isNil "_position") exitWith {};
        
        _empty = _vehicle call FUNC(common,empty);
        _far = {_x distance _vehicle < GVAR(vehicle_respawn_distance_player)} count (call FUNC(common,players)) < 1;
        
        if (isNil "_threshold" || {!_empty} || {!_far}) then {
            _threshold = _vehicle call FUNC(THIS_MODULE,threshold);
            
            if (!isNil "_threshold") then {
                _vehicle setVariable [QGVAR(threshold), call FUNC(common,time) + _threshold];
            };
        };
        
        _dead = !alive _vehicle;
        
        if (isNil "_expiration" && {_dead}) then {
            _expiration = call FUNC(common,time) + GVAR(vehicle_respawn_time_expiration);
            _vehicle setVariable [QGVAR(expiration), _expiration];
        };
        
        _moved = _vehicle distance _position > 10;
        _type = typeOf _vehicle;
        
        _expired = !isNil "_threshold" && {_empty} && {_moved} && {_far} && {!_dead} && {call FUNC(common,time) > _threshold};
        _disabled = _empty && {_dead} && {call FUNC(common,time) > _expiration}; 
    
        if (_expired || {_disabled}) exitWith {
            deleteVehicle _vehicle;
            
            _vehicle = objNull;
            _vehicle = createVehicle [_type, _position, [], 0, "NONE"];
            _vehicle setDir _direction;
            _vehicle setPos _position;
            _vehicle setFuel 1;
            
            _vehicle setVariable [QGVAR(position), _position, true];
            _vehicle setVariable [QGVAR(direction), _direction, true];
            
            [nil, nil, rExecVM, __handlerRE(vehicle), _vehicle] call RE;
        };
        
        sleep 20;
    };
};