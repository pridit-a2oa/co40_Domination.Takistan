/**
 * Perk Submodule
 */

#include "x_macros.sqf"

// if (!__module(perk)) exitWith {hint "no perk module"};

hint "perk module";

this addAction ["My Perks" call FUNC(server,GreyText), SCRIPT(perk,dialog), [], -2, false, true, "", "player in _target"];