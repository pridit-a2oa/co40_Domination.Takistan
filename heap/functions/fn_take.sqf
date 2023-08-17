#include "x_macros.sqf"
private ["_primary", "_secondary", "_weapon"];

_primary = primaryWeapon player;
_secondary = secondaryWeapon player;

_weapon = switch (true) do {
    case !([_secondary, ""] call BIS_fnc_areEqual): {
        _secondary
    };

    case (!([_primary, ""] call BIS_fnc_areEqual) && {[getNumber (configFile >> "CfgWeapons" >> _primary >> "type"), 5] call BIS_fnc_areEqual}): {
        _primary
    };

    default {nil};
};

if !(isNil "_weapon") then {
    private ["_animation"];

    player action ["dropWeapon", player, _weapon];

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