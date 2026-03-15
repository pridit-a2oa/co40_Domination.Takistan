#define THIS_MODULE gear
#include "x_macros.sqf"
private ["_unit", "_identifier", "_key"];

PARAMS_2(_unit, _identifier);

if !(isServer) exitWith {};

_key = _identifier call FUNC(THIS_MODULE,key);

waitUntil {sleep 0.1; !isNil {serverNamespace getVariable _key}};

[_unit, "spawn", [[(serverNamespace getVariable _key) select 1], {
    private ["_gear"];

    PARAMS_1(_gear);

    if ([_gear, []] call BIS_fnc_areEqual || {[typeOf player, "BAF_Soldier_Medic_DDPM"] call BIS_fnc_areEqual}) exitWith {
        call FUNC(THIS_MODULE,default);
    };

    if (!isNil QMODULE(setting) && {[(player getVariable QGVAR(gear)) select 1, 0] call BIS_fnc_areEqual}) exitWith {
        call FUNC(THIS_MODULE,default);
    };

    {
        player addMagazine _x;
    } forEach ([
        _gear select 0,
        "magazine"
    ] call FUNC(THIS_MODULE,items));

    {
        player addWeapon _x;
    } forEach ([
        _gear select 1,
        "weapon",
        "restored"
    ] call FUNC(THIS_MODULE,items));

    {
        if !([_x, ""] call BIS_fnc_areEqual) exitWith {
            if ([getNumber (configFile >> "CfgWeapons" >> _x >> "Type"), 4] call BIS_fnc_areEqual) exitWith {};

            player selectWeapon _x;
        };
    } forEach [primaryWeapon player, secondaryWeapon player];

    if ([currentWeapon player, ""] call BIS_fnc_areEqual) then {
        {
            if ([getNumber (configFile >> "CfgWeapons" >> _x >> "Type"), 2] call BIS_fnc_areEqual) exitWith {
                player selectWeapon _x;
            };
        } forEach (_gear select 1);
    };

    [true, "switchMove", [player, ""]] call FUNC(network,mp);
}]] call FUNC(network,mp);