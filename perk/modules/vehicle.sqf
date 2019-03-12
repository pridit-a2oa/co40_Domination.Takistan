/**
 * Perk - Vehicle Submodule
 */

#define THIS_MODULE perk
#include "x_macros.sqf"
PARAMS_1(_vehicle);

_vehicle addAction ["My Perks" call FUNC(common,GreyText), __script(dialog), [], -2, false, true, "", "player in _target"];