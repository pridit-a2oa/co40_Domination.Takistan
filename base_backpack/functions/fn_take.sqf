#include "x_macros.sqf"
private ["_secondary", "_anim"];

_secondary = secondaryWeapon player;

if (_secondary != "") then {
    player action ["dropWeapon", player, _secondary];
    
    sleep 0.1;
    
    _anim = animationState player;
    
    waitUntil {animationState player != _anim};
};

removeBackpack player;

player addBackpack (_this select 3) select 0;

clearMagazineCargo (unitBackpack player);