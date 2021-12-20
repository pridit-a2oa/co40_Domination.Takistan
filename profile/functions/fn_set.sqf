#define THIS_MODULE profile
#include "x_macros.sqf"
private ["_key", "_value"];

PARAMS_2(_key, _value);

if !([_key] call FUNC(THIS_MODULE,valid)) exitWith {};

profileNamespace setVariable [
    _key,
    _value
];