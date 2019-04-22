/**
 * Base Shield Module (Handler)
 */

#define THIS_MODULE base_shield
#include "x_macros.sqf"

if (hasInterface) then {
    _shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(flag));
    _shield setDir -211;
    _shield setPos [(position GVAR(flag)) select 0, (position GVAR(flag)) select 1, -24];
    _shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];

    _shield = "ProtectionZone_Ep1" createVehicleLocal (position GVAR(flag));
    _shield setDir -211;
    _shield setPos [getPosASL GVAR(flag) select 0, getPosASL GVAR(flag) select 1, -28.48];
    _shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0.7,ca)"];
};

if (isServer) then {
    _trigger = createTrigger ["EmptyDetector", position GVAR(flag)];
    _trigger setTriggerArea [25, 25, 0, false];
    _trigger setTriggerActivation ["EAST", "PRESENT", true];
    _trigger setTriggerStatements ["this", "thislist call {{_x setDamage 1} forEach _this}", ""];
};