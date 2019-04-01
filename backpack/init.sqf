/**
 * Backpack Module
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

player setVariable [QGVAR(backpack), []];

__cppfln(FUNC(THIS_MODULE,equip),THIS_MODULE\functions\fn_equip.sqf);
__cppfln(FUNC(THIS_MODULE,store),THIS_MODULE\functions\fn_store.sqf);

if (!isNil QMODULE(perk)) then {
    __submodule(perk);
};

MODULE(THIS_MODULE) = true;