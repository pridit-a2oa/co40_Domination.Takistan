#include "x_macros.sqf"

_shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(FLAG_BASE));
_shield setDir -211;
_shield setPos (position GVAR(FLAG_BASE));
_shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];

_shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(FLAG_BASE));
_shield setDir -211;
_shield setPos [getPosASL GVAR(FLAG_BASE) select 0, getPosASL GVAR(FLAG_BASE) select 1, -28.48];
_shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0.7,ca)"];