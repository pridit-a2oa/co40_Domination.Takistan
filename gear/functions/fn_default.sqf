#include "x_macros.sqf"

if !(hasInterface) exitWith {};

{
    player addWeapon _x;
} forEach [
    format ["Binocular%1", if (str player in GVAR(MRKS)) then {"_Vector"} else {""}],
    "ItemCompass",
    "ItemGPS",
    "ItemMap",
    "ItemRadio",
    "ItemWatch",
    "NVGoggles"
];

[true, "switchMove", [player, ""]] call FUNC(network,mp);