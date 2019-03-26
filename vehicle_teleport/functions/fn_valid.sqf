#include "x_macros.sqf"
private ["_valid"];

_valid = [];

if (!isNil QMODULE(vehicle_mhq)) then {
    {
        _valid = _valid + (entities _x);
    } forEach GVAR(vehicle_mhq_types);
};

_valid