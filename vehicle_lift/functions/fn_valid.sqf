#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle", "_types", "_alive", "_attached", "_nearest", "_attach", "_attachee", "_action"];

PARAMS_3(_vehicle, _types, _alive);

disableSerialization;

_vehicle setVariable [QGVAR(attached), false];

while {player == driver _vehicle} do {
    _attach = _vehicle getVariable QGVAR(attach);
    _attached = _vehicle getVariable QGVAR(attached);
    
    if (!isNil "_attach") then {
        _attachee = _attach select 0;
        _action = _attach select 1;
    };
    
    if ((position _vehicle) select 2 < 10) then {
        _nearest = nearestObjects [position _vehicle, _types, 15];
        _nearest = if (_nearest select 0 != (vehicle player)) then {_nearest select 0} else {_nearest select 1};
        
        if (isNil "_nearest" || {_attached}) then {
            67321 cutRsc ["Default", "PLAIN"];
        };
        
        if (!isNil "_attach") exitWith {
            // should the nearest vehicle no longer match the one that was
            // the nearest when the action was added, remove the action
            if (isNil "_nearest" || {_nearest != _attachee}) exitWith {
                _vehicle removeAction _action;
                _vehicle setVariable [QGVAR(attach), nil];
            };
        };
        
        if (!isNil "_nearest" && {!_attached} && {str (alive _nearest) == str (_alive)}) then {
            _vehicle setVariable [QGVAR(attach), [
                _nearest,
                (_vehicle addAction [(format ["Lift %1", [typeOf (_nearest)] call FUNC(vehicle,name)]) call FUNC(common,YellowText), __function(lift), _nearest, 10, false, true, "", "player == driver _target"])
            ]];
        };
    } else {
        67321 cutRsc ["Default", "PLAIN"];
        
        if (!isNil "_attach") then {
            _vehicle removeAction _action;
            _vehicle setVariable [QGVAR(attach), nil];
        };
    };
    
    sleep 1;
};