#define THIS_MODULE backpack
#include "x_macros.sqf"
private ["_backpack", "_action"];

_backpack = GVAR(backpack);

if (!isNil QMODULE(heap) && {!([_backpack select 0] __submodulePP(heap))}) exitWith {};
if (!([secondaryWeapon player, ""] call BIS_fnc_areEqual) && {[getNumber (configFile >> "CfgWeapons" >> (_backpack select 0) >> "type"), 5] call BIS_fnc_areEqual}) exitWith {};

_action = player getVariable QGVAR(backpack_action);

player removeAction _action;

GVAR(backpack) = [];

player setVariable [QGVAR(backpack_action), nil];

if !([primaryWeapon player, ""] call BIS_fnc_areEqual) then {
    player selectWeapon (primaryWeapon player);

    call FUNC(THIS_MODULE,store);
};

for "_i" from 1 to (_backpack select 2) do {
    player addMagazine (_backpack select 1);
};

player addWeapon (_backpack select 0);
player selectWeapon (_backpack select 0);