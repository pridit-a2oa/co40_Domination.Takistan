#include "x_macros.sqf"
private ["_unit", "_position", "_type", "_objects", "_object"];

PARAMS_2(_unit, _position);

_type = (_unit getVariable QGVAR(respawn_type)) select 1;

_unit setDir 240.214;

if (!isNil QMODULE(vehicle_mhq) && {_type == "mhq"}) exitWith {
    _objects = nearestObjects [_position, GVAR(vehicle_mhq_types), GVAR(respawn_distance_valid)];
    
    {
        if (_x getVariable QGVAR(deployed)) exitWith {
            _object = _x;
        };
    } forEach _objects;
    
    if (!isNil "_object") then {
        _vehicle = _object modelToWorld [0, -6, 0];
        
        _unit setDir (getDir _object);
        _unit setPos [_vehicle select 0, _vehicle select 1, 0];
    };
};