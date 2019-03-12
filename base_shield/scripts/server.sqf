#include "x_macros.sqf"

_shield = "ProtectionZone_Ep1" createVehicle (position GVAR(FLAG_BASE));
_shield setDir -211;
_shield setPos (position GVAR(FLAG_BASE));
_shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];

_trigger = createTrigger ["EmptyDetector", position GVAR(FLAG_BASE)];
_trigger setTriggerArea [25, 25, 0, false];
_trigger setTriggerActivation ["EAST", "PRESENT", true];
_trigger setTriggerStatements ["this", "thislist call {{_x setDamage 1} forEach _this}", ""];