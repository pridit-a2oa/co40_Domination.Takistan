/**
 * Language Module
 *
 * Description: This module facilitates localized text. While stringtable.xml
 * is the expected and easier solution to support localization, this has
 * limitations warranting a custom solution.
 */

#define THIS_MODULE language
#include "x_macros.sqf"

// Types of languages to support
GVAR(language_types) = [
    ["CZ", "Czech (0%)"],
    ["EN", "English"],
    ["FR", "French (0%)"],
    ["DE", "German (0%)"],
    ["IT", "Italian (0%)"],
    ["PL", "Polish (0%)"],
    ["RU", "Russian (0%)"],
    ["ES", "Spanish (0%)"],
]

__cppfln(FUNC(THIS_MODULE,localize),THIS_MODULE\functions\fn_localize.sqf);

MODULE(THIS_MODULE) = true;