#include "x_macros.sqf"
private ["_vehicle", "_vehicles"];

PARAMS_1(_vehicle);

_vehicles = [_vehicle];

if (alive _vehicle) then {
    {
        moveOut _x;
    } forEach crew _vehicle;
};

if !(isNil QMODULE(vehicle_lift)) then {
    private ["_attached"];

    _attached = _vehicle getVariable QGVAR(attached);

    if !(isNull _attached) then {
        _attached setVariable [QGVAR(spawn), _vehicle getVariable QGVAR(spawn), true];

        [_vehicle] call FUNC(vehicle_lift,detach);

        [_vehicles, _attached] call BIS_fnc_arrayPush;
    };
};

systemChat format ["%1", str _vehicles];

{
    private ["_position"];

    _position = _x getVariable QGVAR(spawn);

    _x setPos [_position select 0, _position select 1, 0];

    [true, "setVectorUp", [_x, surfaceNormal _position]] call FUNC(network,mp);
    [_x, "setVelocity", [0, 0, 0]] call FUNC(network,mp);

    if (alive _x) then {
        [_x, "engineOn", false] call FUNC(network,mp);
    };
} forEach _vehicles;