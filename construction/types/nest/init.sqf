/**
 * Construction - (MG) Nest Module
 */

#define THIS_MODULE construction_nest
#include "x_macros.sqf"

// Set object of construction
GVAR(construction_nest_object) = "WarfareBMGNest_M240_US_EP1";

if (hasInterface) then {
    player setVariable [QGVAR(nest_ammo), 0.5];
    player setVariable [QGVAR(nest_type), GVAR(construction_nest_object)];
};

[
    GVAR(construction_types),
    [
        "Nest",
        [[GVAR(construction_nest_object), 0]],
        "ca\ui\data\iconmg_ca"
    ]
] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;