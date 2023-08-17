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

    default {""};
};

_weapon