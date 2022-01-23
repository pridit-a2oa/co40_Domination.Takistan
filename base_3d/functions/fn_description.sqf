#define THIS_MODULE base_3d
#include "x_macros.sqf"
private ["_name", "_description"];

PARAMS_1(_name);

_description = "";

if (!isNil QMODULE(vehicle_ammobox)) then {
    _description = _description + ([_name] __submodulePP(vehicle_ammobox));
};

if (!isNil QMODULE(vehicle_lift)) then {
    _description = _description + ([_name] __submodulePP(vehicle_lift));
};

if (!isNil QMODULE(vehicle_wreck)) then {
    _description = _description + ([_name] __submodulePP(vehicle_wreck));
};

_description