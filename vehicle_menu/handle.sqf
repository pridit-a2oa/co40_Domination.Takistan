/**
 * Vehicle Menu Module (Handler)
 */

#include "x_macros.sqf"
private ["_valid"];

_valid = [];

if (!isNil QMODULE(vehicle_ammobox)) then {
    [_valid, GVAR(vehicle_ammobox_types)] call FUNC(common,arrayPushStack);
};

if (!isNil QMODULE(vehicle_deploy)) then {
    [_valid, [0, call FUNC(vehicle_deploy,types)] call FUNC(common,arrayValues)] call FUNC(common,arrayPushStack);
};

if (!isNil QMODULE(vehicle_loadout)) then {
    [_valid, [0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues)] call FUNC(common,arrayPushStack);
};

if (!isNil QMODULE(vehicle_pack)) then {
    [_valid, GVAR(vehicle_pack_types)] call FUNC(common,arrayPushStack);
};

if (!isNil QMODULE(vehicle_ramp)) then {
    [_valid, GVAR(vehicle_ramp_types)] call FUNC(common,arrayPushStack);
};

if (!isNil QMODULE(vehicle_texture)) then {
    [_valid, [0, GVAR(vehicle_texture_types)] call FUNC(common,arrayValues)] call FUNC(common,arrayPushStack);
};

GVAR(vehicle_menu_types) = GVAR(vehicle_menu_types) + _valid;