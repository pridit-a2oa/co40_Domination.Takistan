/**
 * Vehicle Respawn Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_respawn
#include "x_macros.sqf"
private ["_vehicle", "_type", "_position", "_direction", "_threshold", "_expiration", "_empty", "_disabled", "_dead"];
PARAMS_1(_vehicle);

if ((getMarkerPos QGVAR(base_marker)) distance _vehicle >= GVAR(respawnable_base_distance)) exitWith {};

if (_vehicle isKindOf "Car" || _vehicle isKindOf "Air") then {
    while {true} do {
        _position = _vehicle getVariable QGVAR(position);
        _direction = _vehicle getVariable QGVAR(direction);
        _threshold = _vehicle getVariable QGVAR(threshold);
        _expiration = _vehicle getVariable QGVAR(expiration);
        
        if (isNil "_position") then {
            _position = position _vehicle;
            _vehicle setVariable [QGVAR(position), _position];
        };
        
        if (isNil "_direction") then {
            _direction = getDir _vehicle;
            _vehicle setVariable [QGVAR(direction), _direction];
        };
        
        if (isNil "_threshold") then {
            _threshold = _vehicle call FUNC(THIS_MODULE,threshold);
            
            if (!isNil "_threshold") then {
                _threshold = time + _threshold;
                _vehicle setVariable [QGVAR(threshold), _threshold];
            };
        };
        
        _empty = _vehicle call FUNC(server,empty);
        _disabled = !canMove _vehicle;
        
        if (!isNil "_threshold") then {
            if (time > _threshold && _empty) then {
                _disabled = true;
            };
            
            if (!_empty) then {
                _threshold = _vehicle call FUNC(THIS_MODULE,threshold);
                _vehicle setVariable [QGVAR(threshold), time + _threshold];
            };
        };
        
        _dead = !alive _vehicle;
        
        if (isNil "_expiration" && {_dead}) then {
            _expiration = time + GVAR(respawnable_expiration);
            _vehicle setVariable [QGVAR(expiration), _expiration];
        };
        
        _moved = _vehicle distance _position > 10;
        _type = typeOf _vehicle;
    
        if (_empty && {_disabled} && {_moved} && {!_dead} || {(_empty && {_dead} && {time > _expiration})}) exitWith {
            deleteVehicle _vehicle;
            
            _vehicle = objNull;
            _vehicle = createVehicle [_type, [0,0,0], [], 0, "NONE"];
            _vehicle setDir _direction;
            _vehicle setPos _position;
            _vehicle setFuel 1;
            
            [nil, nil, rEXECVM, __module2(vehicle), _vehicle] call RE;
        };
        
        sleep 20;
    };
};