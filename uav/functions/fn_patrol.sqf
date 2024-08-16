#define THIS_MODULE uav
#include "x_macros.sqf"
private ["_aircraft", "_position", "_radius", "_angle", "_angle_threshold", "_patrol", "_waypoint"];

PARAMS_3(_aircraft, _position, _radius);

_angle = 60;
_angle_threshold = _angle * 3;

while {alive _aircraft && {canMove _aircraft && {call FUNC(common,time) < _aircraft getVariable QGVAR(uav_airborne)}}} do {
    _patrol = [_position, GVAR(uav_distance_waypoint), _angle] call BIS_fnc_relPos;
    _patrol = [_patrol select 0, _patrol select 1, GVAR(uav_amount_height)];

    if (!isNil QMODULE(debug)) then {
        [_patrol] __submoduleVM(debug);
    };

    _waypoint = (group _aircraft) addWaypoint [_patrol, -1];

    _waypoint setWaypointBehaviour "CARELESS";
    _waypoint setWaypointCombatMode "BLUE";
    _waypoint setWaypointType "MOVE";

    _angle = _angle + 60;

    if !(isNil QMODULE(conversation)) then {
        if ([_angle, _angle_threshold] call BIS_fnc_areEqual) then {
            [
                [GVAR(crossroad), GVAR(crossroad2)],
                [QUOTE(THIS_MODULE), "InRange"]
            ] call FUNC(conversation,radio);

            _aircraft setVariable [QGVAR(uav_range), true];

            [true, "spawn", [[_position, _radius], {
                private ["_position", "_radius"];

                PARAMS_2(_position, _radius);

                if (isNil QMODULE(marker)) exitWith {};

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
                ] call FUNC(marker,create);
            }]] call FUNC(network,mp);
        };
    };

    waitUntil {sleep 1; [_aircraft, _patrol] call FUNC(THIS_MODULE,valid)};
};