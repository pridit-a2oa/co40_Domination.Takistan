/**
 * Construction - MASH Module
 */

#define THIS_MODULE construction_mash
#include "x_macros.sqf"

// Set object of construction
GVAR(construction_mash_object) = "MASH_EP1";

if (hasInterface) then {
    player setVariable [QGVAR(mash_type), GVAR(construction_mash_object)];
};

[
    GVAR(construction_types),
    [
        "MASH",
        [[GVAR(construction_mash_object), 180]],
        "ca\ui\data\icon_unit_agony_ca"
    ]
] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;