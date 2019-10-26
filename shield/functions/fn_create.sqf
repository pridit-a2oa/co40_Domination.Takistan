#include "x_macros.sqf"
private ["_position", "_shield"];

PARAMS_1(_position);

if (hasInterface) then {    
    _shield = GVAR(shield_type) createVehicleLocal _position;
    _shield setDir -211;
    _shield setPos [_position select 0, _position select 1, -28.48];
    _shield setObjectTexture [0, "#(argb,8,8,3)color(0,0,0,0.7,ca)"];
};

_shield = GVAR(shield_type) createVehicleLocal _position;
_shield setDir -211;
_shield setPos [_position select 0, _position select 1, -24];
_shield setObjectTexture [0, "#(argb,8,8,3)color(0,0,0,0,ca)"];