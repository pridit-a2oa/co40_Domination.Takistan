/**
 * Construction Module (Handler)
 */

#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_type", "_object"];

_objects = [];

if (!isNil QMODULE(farp)) then {
    _objects = _objects + [["farp", GVAR(farp_type)]];
};

if (!isNil QMODULE(mash)) then {
    _objects = _objects + [["mash", GVAR(mash_type)]];
};

if (!isNil QMODULE(nest)) then {
    _objects = _objects + [["nest", GVAR(nest_type)]];
};

if (!isNil QMODULE(trench)) then {
    _objects = _objects + [["trench", GVAR(trench_type)]];
};

GVAR(construction_type_objects) = _objects;