#define THIS_MODULE vehicle_3d
#include "x_macros.sqf"
private ["_name", "_description"];

PARAMS_1(_name);

_description = "";

if (!isNil QMODULE(vehicle_ramp) && {!isNil QMODULE(halo)}) then {
    _description = _description + ([_name] __submodulePP(vehicle_ramp));
};

if (!isNil QMODULE(vehicle_ammobox)) then {
    _description = _description + ([_name] __submodulePP(vehicle_ammobox));
};

if (!isNil QMODULE(vehicle_fob)) then {
    _description = _description + ([_name] __submodulePP(vehicle_fob));
};

if (!isNil QMODULE(vehicle_mhq)) then {
    _description = _description + ([_name] __submodulePP(vehicle_mhq));
};

if (!isNil QMODULE(vehicle_lift)) then {
    _description = _description + ([_name] __submodulePP(vehicle_lift));
};

if (!isNil QMODULE(vehicle_uav)) then {
    _description = _description + ([_name] __submodulePP(vehicle_uav));
};

_description