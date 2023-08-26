/**
 * Debug Module (Handler)
 */

#define THIS_MODULE debug
#include "x_macros.sqf"

if (hasInterface) then {
    0 spawn FUNC(THIS_MODULE,groups);

    // 0 spawn {
    //     while {true} do {
    //         {
    //             if ((faction _x) in ["BIS_TK", "BIS_TK_INS"]) then {
    //                 _x setDamage 1;
    //             };
    //         } forEach allUnits;

    //         sleep 2;
    //     };
    // };
};

// call FUNC(THIS_MODULE,compositions);