#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_vehicle", "_position", "_direction", "_type", "_variables", "_new"];

PARAMS_3(_vehicle, _position, _direction);

_type = [_this, 3, typeOf _vehicle] call FUNC(common,param);

_variables = [];

{
    if !(isNil {_vehicle getVariable (format [QUOTE(d_%1), _x])}) then {
        [
            _variables,
            [_x, _vehicle getVariable (format [QUOTE(d_%1), _x])]
        ] call BIS_fnc_arrayPush;
    };
} forEach [
    "position",
    "direction",
    "type",
    "respawnable",
    "wreckable"
];

[_vehicle] call FUNC(THIS_MODULE,delete);

sleep 0.5;

_new = createVehicle [_type, _position, [], 0, "NONE"];
_new setDir _direction;
_new setPos _position;
_new setVelocity [0, 0, 0];
_new setVectorUp surfaceNormal _position;

{
    _new setVariable [
        format [QUOTE(d_%1), _x select 0],
        _x select 1,
        true
    ];
} forEach _variables;

_new