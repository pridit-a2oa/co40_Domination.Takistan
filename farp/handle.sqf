/**
 * FARP Module (Handler)
 */

#include "x_macros.sqf"

if (isServer) then {
    {
        _x setAmmoCargo 0;
    } forEach (allMissionObjects GVAR(farp_type));
}