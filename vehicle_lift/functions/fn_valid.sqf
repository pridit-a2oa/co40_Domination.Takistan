#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle", "_nearest", "_attach", "_attachee", "_action"];
PARAMS_1(_vehicle);

_vehicle setVariable [QGVAR(attached), false];

while {player == driver _vehicle} do {
    if (!(_vehicle getVariable QGVAR(attached))) then {
        _nearest = nearestObjects [position _vehicle, ["LandVehicle"], 40];
        
        if (count _nearest > 0) then {
            _nearest = _nearest select 0;
            
            _attach = _vehicle getVariable QGVAR(attach);
            
            if (!isNil "_attach") exitWith {
                _attachee = _attach select 0;
                _action = _attach select 1;
                
                // should the nearest vehicle no longer match the one that was
                // the nearest when the action was added, remove the action
                if (_nearest != _attachee) then {
                    _vehicle removeAction _action;
                    _vehicle setVariable [QGVAR(attach), nil];
                };
            };
            
            _vehicle setVariable [QGVAR(attach), [
                _nearest,
                (_vehicle addAction ["Lift vehicle" call FUNC(common,YellowText), __function(lift), _nearest, 10, false, true, "", "player == driver _target"])
            ]];
        };
    };

    sleep 2;
};