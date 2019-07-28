/**
 * Vehicle Marker - Vehicle Lift Submodule
 */

#include "x_macros.sqf"
private ["_attacher", "_attachee"];

PARAMS_2(_attacher, _attachee);

while {true} do {
    _attached = _attacher getVariable QGVAR(attached);
    _position = _attachee getVariable QGVAR(position);
    
    if (isNil "_position") exitWith {
        [_attacher, "", _attacher getVariable QGVAR(release), _attachee] call FUNC(vehicle_lift,release);
    };
    
    _marker = str (_position select 0);
    
    if (!isNil "_position" && {!isNull _attached}) then {
        if (markerAlpha _marker == 1) then {
            _attachee setVariable [QGVAR(hidden), true, true];
        };
    };
    
    if (isNull _attached) exitWith {
        _attachee setVariable [QGVAR(hidden), false, true];
    };
    
    sleep 5;
};