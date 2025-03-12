#define THIS_MODULE uav
#include "x_macros.sqf"
private ["_aircraft", "_position", "_radius", "_angle", "_threshold"];

PARAMS_3(_aircraft, _position, _radius);

_angle = 60;
_threshold = _angle * 3;

while {alive _aircraft && {canMove _aircraft && {call FUNC(common,time) < _aircraft getVariable QGVAR(uav_airborne)}}} do {
    private ["_patrol", "_waypoint"];

    _patrol = [_position, GVAR(uav_distance_waypoint), _angle] call BIS_fnc_relPos;
    _patrol set [2, GVAR(uav_amount_height)];

    if !(isNil QMODULE(debug)) then {
        [_patrol] __submoduleVM(debug);
    };

    _waypoint = (group _aircraft) addWaypoint [_patrol, -1];
    _waypoint setWaypointBehaviour "CARELESS";
    _waypoint setWaypointCombatMode "BLUE";
    _waypoint setWaypointType "MOVE";

    _angle = _angle + 60;

    if ([_angle, _threshold] call BIS_fnc_areEqual) then {
        _aircraft setVariable [QGVAR(uav_range), true];

        if !(isNil QMODULE(conversation)) then {
            [
                [GVAR(crossroad), GVAR(crossroad2)],
                [QUOTE(THIS_MODULE), "InRange"]
            ] call FUNC(conversation,radio);
        };

        if !(isNil QMODULE(marker)) then {
            [true, "execVM", [
                [
                    format ["uav_%1", _position],
                    _position,
                    "",
                    "",
                    "Default",
                    0.6,
                    "ELLIPSE",
                    "FDiagonal",
                    [_radius, _radius]
                ],
                FUNCTION(marker,create)
            ]] call FUNC(network,mp);
        };
    };

    waitUntil {
        sleep 1;

        [_aircraft, _patrol] call FUNC(THIS_MODULE,valid)
    };
};