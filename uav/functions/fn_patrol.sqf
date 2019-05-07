#include "x_macros.sqf"
private ["_aircraft", "_position", "_angle", "_angle_threshold", "_patrol"];

PARAMS_2(_aircraft, _position);

_angle = 60;
_angle_threshold = _angle * 3;

while {alive _aircraft && {canMove _aircraft} && {time < _aircraft getVariable QGVAR(uav_airborne)}} do {
    _patrol = [_position, GVAR(uav_distance_scan) + 1000, _angle] call BIS_fnc_relPos;

    _aircraft doMove _patrol;

    (group _aircraft) setBehaviour "CARELESS";
    (group _aircraft) setCombatMode "BLUE";
    
    _angle = _angle + 60;
    
    if (!isNil QMODULE(crossroad)) then {
        if (_angle == _angle_threshold) then {
            GVAR(crossroad) kbTell [GVAR(crossroad2), "uav", "InRange", true];
            
            _aircraft setVariable [QGVAR(uav_range), true];
        };
    };

    waitUntil {!alive _aircraft || {!canMove _aircraft} || {time > _aircraft getVariable QGVAR(uav_airborne)} || {_aircraft distance _patrol < 800}};
    
    sleep 1;
};