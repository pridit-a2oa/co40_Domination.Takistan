#include "x_macros.sqf"
private ["_position", "_object"];

PARAMS_1(_position);

_object = createVehicle [
    GVAR(teleport_type_object),
    _position,
    [],
    0,
    "NONE"
];

_object setVariable [QGVAR(teleport), true, true];

_object