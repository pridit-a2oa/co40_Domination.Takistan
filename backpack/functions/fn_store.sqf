#define THIS_MODULE backpack
#include "x_macros.sqf"
private ["_weapon", "_magazines", "_sidearm", "_animation"];

_weapon = weaponState player;
_magazines = [_weapon] call FUNC(THIS_MODULE,magazines);

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

if (primaryWeapon player != "") then {
    _weapon = weaponState player;
    
    player removeWeapon (_weapon select 0);
    player removeMagazines (_weapon select 3);
};

call FUNC(THIS_MODULE,action);