#define THIS_MODULE respawn
#include "x_macros.sqf"
private ["_unit", "_position", "_type", "_types", "_objects", "_deployed", "_object"];

PARAMS_2(_unit, _position);

_type = (_unit getVariable QGVAR(respawn_type)) select 1;

_unit setDir 239;

if ([_type, "base"] call BIS_fnc_areEqual) exitWith {};

_types = call compile format [
    "d_%1_type%2",
    _type,
    if !([_type, "mash"] call BIS_fnc_areEqual) then {"s"} else {""}
];

_objects = nearestObjects [
    _position,
    if ([typeName _types, "ARRAY"] call BIS_fnc_areEqual) then {_types} else {[_types]},
    call compile format ["d_%1_distance_respawn", _type]
];

{
    if !(isNil QMODULE(vehicle_deploy)) then {
        _deployed = _x getVariable QGVAR(deployed);
    };

    if (isNil "_deployed") exitWith {
        _object = _x;
    };

    if (!isNil "_deployed" && {(_x getVariable QGVAR(deployed)) select 0}) exitWith {
        _object = _x;
    };
} forEach _objects;

if !(isNil "_object") then {
    _model = _object modelToWorld ([typeOf _object] call FUNC(vehicle,offsetPlayer));

    _unit setDir (getDir _object);
    _unit setPos [_model select 0, _model select 1, 0];
};