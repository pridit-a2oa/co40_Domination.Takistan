#define THIS_MODULE vehicle_3d
#include "x_macros.sqf"
private ["_type", "_description"];

PARAMS_1(_type);

_description = "";

if (!isNil QMODULE(vehicle_ramp) && {!isNil QMODULE(halo)}) then {
    _description = _description + ([_type] __submodulePP(vehicle_ramp));
};

if (!isNil QMODULE(vehicle_lift)) then {
    _description = _description + ([_type] __submodulePP(vehicle_lift));
};

if (!isNil QMODULE(vehicle_ammobox)) then {
    _description = _description + ([_type] __submodulePP(vehicle_ammobox));
};

if (!isNil QMODULE(vehicle_fob)) then {
    _description = _description + ([_type] __submodulePP(vehicle_fob));
};

if (!isNil QMODULE(vehicle_mhq)) then {
    _description = _description + ([_type] __submodulePP(vehicle_mhq));
};

if (!isNil QMODULE(inventory)) then {
    _description = _description + ([_type] __submodulePP(inventory));
};

_description