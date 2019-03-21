/**
 * Base Shield Module
 */

#define THIS_MODULE base_shield
#include "x_macros.sqf"

if (isServer) then {
    _trigger = createTrigger ["EmptyDetector", position GVAR(FLAG_BASE)];
    _trigger setTriggerArea [25, 25, 0, false];
    _trigger setTriggerActivation ["EAST", "PRESENT", true];
    _trigger setTriggerStatements ["this", "thislist call {{_x setDamage 1} forEach _this}", ""];
};

if (hasInterface) then {
    _shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(FLAG_BASE));
    _shield setDir -211;
    _shield setPos [(position GVAR(FLAG_BASE)) select 0, (position GVAR(FLAG_BASE)) select 1, -24];
    _shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];

    _shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(FLAG_BASE));
    _shield setDir -211;
    _shield setPos [getPosASL GVAR(FLAG_BASE) select 0, getPosASL GVAR(FLAG_BASE) select 1, -28.48];
    _shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0.7,ca)"];
};

MODULE(THIS_MODULE) = true;