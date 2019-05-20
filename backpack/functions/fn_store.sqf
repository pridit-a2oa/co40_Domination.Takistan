#define THIS_MODULE backpack
#include "x_macros.sqf"
private ["_weapon", "_magazines", "_sidearm", "_animation"];

_weapon = weaponState player;
_magazines = [];

{
    if (_x == (_weapon select 3)) then {
        _magazines = _magazines + [_x];
    };
} forEach (magazines player);

GVAR(backpack) = [
    _weapon select 0,
    _weapon select 3,
    count (_magazines)
];

player removeWeapon (_weapon select 0);
player removeMagazines (_weapon select 3);

// workaround due to a holstered sidearm being considered the current weapon
// when it should be empty
if (getNumber (configFile >> "CfgWeapons" >> (currentWeapon player) >> "Type") == 2) then {
    _sidearm = currentWeapon player;
    
    player removeWeapon _sidearm;
};

sleep 1;

_anim = animationState player;
waitUntil {animationState player != _anim};

if (!isNil "_sidearm") then {
    player addWeapon _sidearm;
};

call FUNC(THIS_MODULE,action);