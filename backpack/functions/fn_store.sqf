#include "x_macros.sqf"
private ["_weapon", "_magazines", "_name", "_sidearm", "_animation", "_action"];

_weapon = weaponState player;
_magazines = [];
_name = getText (configFile >> "CfgWeapons" >> (_weapon select 0) >> "displayName");

{
    if (_x == (_weapon select 3)) then {
        _magazines = _magazines + [_x];
    };
} forEach (magazines player);

player setVariable [QGVAR(backpack_hold), [
    _weapon select 0,
    _weapon select 3,
    count (_magazines)
]];

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

_action = player addAction [(format ["Equip %1", _name]) call FUNC(common,GreyText), FUNCTION(backpack,equip), [], -1, false, true, "", "player getVariable 'd_backpack' && {count (player getVariable 'd_backpack_hold') > 0} && {(d_backpack_animations find (animationState player)) == -1}"];

player setVariable [QGVAR(backpack_action), _action];