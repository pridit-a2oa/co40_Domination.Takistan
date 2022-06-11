/**
 * Ammobox Module - Vehicle FOB Submodule
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_object", "_ammobox"];

PARAMS_1(_object);

_ammobox = [
    faction _object,
    _object modelToWorld [0, -5.5, -4.95],
    direction _object,
    false
] call FUNC(THIS_MODULE,create);

_ammobox setVariable [QGVAR(immune), true];

_ammobox