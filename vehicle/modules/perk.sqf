/**
 * Vehicle - Perk Submodule
 */

#include "x_macros.sqf"
PARAMS_1(_vehicle);

// if (!__module(perk)) exitWith {hint "no perk module"};

// _vehicle addAction ["My Perks" call FUNC(server,GreyText), SCRIPT(perk,dialog), [], -2, false, true, "", "player in _target"];