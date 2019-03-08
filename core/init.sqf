/**
 * Core Module
 */

#include "x_macros.sqf"

__cppfln(FUNC(objectMapper),ca\modules\dyno\data\scripts\objectMapper.sqf);

GVAR(init_obj) = "HeliHEmpty" createVehicleLocal [0, 0, 0];
GVAR(init_obj) addEventHandler ["killed", {__ccppfln(server.sqf);deleteVehicle GVAR(init_obj);GVAR(init_obj) = nil}];
GVAR(init_obj) setDamage 1;

skipTime 5;