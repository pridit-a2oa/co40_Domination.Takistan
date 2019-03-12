#define THIS_MODULE backpack
#include "x_macros.sqf"
PARAMS_1(_heap);

_backpacks = [
    "TK_ALICE_Pack_EP1",
    "US_Assault_Pack_EP1",
    "TK_Assault_Pack_EP1",
    "US_Backpack_EP1",
    "BAF_AssaultPack_special",
    "DE_Backpack_Specops_EP1",
    "US_Patrol_Pack_EP1",
    "TK_RPG_Backpack_EP1",
    "Tripod_Bag",
    "US_UAV_Pack_EP1"
];

{
    _name = getText (configFile >> "cfgVehicles" >> _x >> "displayName");
    _heap addAction [format ["Take %1", _name], __script(take), _x];
} forEach _backpacks;