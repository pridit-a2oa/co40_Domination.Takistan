/**
 * Teleport Module (Handler)
 */

#define THIS_MODULE teleport
#include "x_macros.sqf"

if (hasInterface) then {
    {
        _x addAction ["Teleport" call FUNC(common,YellowText), __function(show), [], 2, false, true, "", ""];
    } forEach (allMissionObjects "FlagCarrierUSA_EP1");
};