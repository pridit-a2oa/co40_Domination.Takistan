#include "x_macros.sqf"
private ["_secondary"];

_secondary = secondaryWeapon player;

if !([_secondary, ""] call BIS_fnc_areEqual) then {
    private ["_animation"];

    player action ["dropWeapon", player, _secondary];
    
    sleep 0.1;
    
    _animation = animationState player;
    
    waitUntil {
        sleep 0.1;
        
        !([animationState player, _animation] call BIS_fnc_areEqual)
    };
};

removeBackpack player;

player addBackpack (_this select 3) select 0;

clearMagazineCargo (unitBackpack player);