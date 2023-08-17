#define THIS_MODULE heap
#include "x_macros.sqf"
private ["_weapon", "_position"];

if !([speed player, 0] call BIS_fnc_areEqual) exitWith {};

_weapon = call FUNC(THIS_MODULE,valid);

if !([_weapon, ""] call BIS_fnc_areEqual) then {
    player action ["dropWeapon", player, _weapon];

    {
        deleteVehicle _x;
    } forEach (nearestObjects [player, ["WeaponHolder"], 1]);

    _position = position player;

    waitUntil {
        sleep 0.1;

        player distance (nearestObject [player, "WeaponHolder"]) < 0.8 || {player distance _position > 0.5}
    };
};

if !([player] call FUNC(common,ready)) exitWith {};
if !([call FUNC(THIS_MODULE,valid), ""] call BIS_fnc_areEqual) exitWith {};

removeBackpack player;

player addBackpack (_this select 3) select 0;

clearMagazineCargo (unitBackpack player);