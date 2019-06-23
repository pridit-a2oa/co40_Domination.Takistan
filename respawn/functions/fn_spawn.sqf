#include "x_macros.sqf"
private ["_unit", "_position", "_type"];

PARAMS_2(_unit, _position);

_type = (_unit getVariable QGVAR(respawn_type)) select 1;

if (_type != "base") exitWith {
    _object = (nearestObjects [_position, [_type], GVAR(respawn_distance_valid)]) select 0;
    
    if (!isNil "_object") then {
        if (!isNil QMODULE(vehicle_mhq) && {!(_object getVariable QGVAR(deployed))}) exitWith {};
        
        _vehicle = _object modelToWorld [0, -6, 0];
        
        _unit setDir (getDir _object);
        _unit setPos [_vehicle select 0, _vehicle select 1, 0];
    };
};

_unit setDir 240.214;
