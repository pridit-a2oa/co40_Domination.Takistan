/**
 * Vehicle Respawn Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_type", "_position", "_direction", "_empty", "_disabled", "_dead"];
PARAMS_1(_vehicle);

if (_vehicle isKindOf "Car" || _vehicle isKindOf "Air") then {
    while {true} do {
        _type = typeOf _vehicle;
        _position = _vehicle getVariable QGVAR(position);
        _direction = _vehicle getVariable QGVAR(direction);
        
        if (isNil "_position") then {
            _position = position _vehicle;
            _vehicle setVariable [QGVAR(position), _position];
        };
        
        if (isNil "_direction") then {
            _direction = getDir _vehicle;
            _vehicle setVariable [QGVAR(direction), _direction];
        };
        
        _empty = _vehicle call FUNC(server,empty);
        _disabled = !canMove _vehicle;
        _dead = !alive _vehicle;
    
        if (_empty && {_disabled} || {(_empty && {_dead})}) exitWith {
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