/**
 * Backpack Module
 *
 * Description: This module enables players to carry an additional primary
 * weapon via storing within a virtual backpack.
 */

#define THIS_MODULE backpack
#include "x_macros.sqf"

// Set transitional animations for actions to be hidden
GVAR(backpack_animations) = [
    "amovpercmstpsnonwnondnon_amovpercmstpsraswrfldnon",
    "amovpercmstpsraswrfldnon_amovpercmstpsnonwnondnon",
    "amovpknlmstpsraswrfldnon_amovpknlmstpsraswpstdnon",
    "amovpknlmstpsraswpstdnon_amovpknlmstpsraswrfldnon",
    "amovpercmstpsraswpstdnon_amovpercmstpsnonwnondnon",
    "amovpknlmstpsraswpstdnon_amovpknlmstpsnonwnondnon"
];

if (hasInterface) then {
    player setVariable [QGVAR(backpack), false];
    
    if (isNil {GVAR(backpack)}) then {
        GVAR(backpack) = [];
    };
};

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,equip),THIS_MODULE\functions\fn_equip.sqf);
__cppfln(FUNC(THIS_MODULE,store),THIS_MODULE\functions\fn_store.sqf);

MODULE(THIS_MODULE) = true;