/**
 * Construction - Fortification Module
 */

#define THIS_MODULE construction_fortification
#include "x_macros.sqf"

// Set object of construction
GVAR(construction_fortification_object) = "Fort_EnvelopeBig_EP1";

if (hasInterface) then {
    if (isNil {player getVariable QGVAR(fortification_type)}) then {
        player setVariable [QGVAR(fortification_type), [0, GVAR(construction_fortification_object)]];
    };
};

[
    GVAR(construction_types),
    [
         "Fortification",
        [
            ["Fort_EnvelopeBig_EP1", 0],
            ["Land_fortified_nest_small_EP1", 180],
            ["Land_fort_rampart_EP1", 0]
        ],
        "ca\misc3\data\icons\icon_dragonteeth_ca"
    ]
] call BIS_fnc_arrayPush;

MODULE(THIS_MODULE) = true;