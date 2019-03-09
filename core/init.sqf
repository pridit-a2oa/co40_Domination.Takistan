/**
 * Core Module
 */

#define THIS_MODULE core
#include "x_macros.sqf"

__ccppfln(THIS_MODULE\scripts\common.sqf);

// Functions
__cppfln(FUNC(THIS_MODULE,objectMapper),ca\modules\dyno\data\scripts\objectMapper.sqf);

// Modules
__module(base_upgrades);
__module(boards);
__module(cleanup);
__module(wrecks);

_shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(FLAG_BASE));
_shield setDir -211;
_shield setPos (position GVAR(FLAG_BASE));
_shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];
_trig = createTrigger["EmptyDetector", position GVAR(FLAG_BASE)];
_trig setTriggerArea [25, 25, 0, false];
_trig setTriggerActivation ["EAST", "PRESENT", true];
_trig setTriggerStatements ["this", "thislist call {{_x setDamage 1} forEach _this}", ""];

QGVAR(base_marker) setMarkerAlphaLocal 0;
QGVAR(island_marker) setMarkerAlphaLocal 0;
QGVAR(isledefense_marker) setMarkerAlphaLocal 0;

skipTime 5;