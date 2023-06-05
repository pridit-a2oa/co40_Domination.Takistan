/**
 * Debug Module (Handler)
 */

#define THIS_MODULE debug
#include "x_macros.sqf"

0 spawn {
    while {hasInterface} do {
        _groups = call FUNC(THIS_MODULE,groups);
        
        hintSilent format ["%1", _groups];
        
        sleep 5;
    };
};

// call FUNC(THIS_MODULE,compositions);