/**
 * Marker - Vehicle Lift Submodule
 */

#include "x_macros.sqf"
private ["_attacher", "_attachee"];
PARAMS_2(_attacher,_attachee);

while {true} do {
    _attached = _attacher getVariable QGVAR(attached);
    _position = _attachee getVariable QGVAR(position);
    
    _marker = str (_position select 0);
    
    if (!isNil "_position" && {_attached}) then {
        if (markerAlpha _marker == 1) then {
            _attachee setVariable [QGVAR(hidden), true];
        };
    };
    
    if (!_attached) exitWith {
        _attachee setVariable [QGVAR(hidden), false];
    };
    
    sleep 5;
};

