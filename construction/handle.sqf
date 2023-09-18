/**
 * Construction Module (Handler)
 */

#define THIS_MODULE construction
#include "x_macros.sqf"

if (isServer) then {
    gameLogic setVariable [QGVAR(constructed), []];

    __fsm(cleanup);
};

{
    {
        {
            [_x] call FUNC(THIS_MODULE,protect);
        } forEach (allMissionObjects (_x select 0));
    } forEach (_x select 1);
} forEach GVAR(construction_types);