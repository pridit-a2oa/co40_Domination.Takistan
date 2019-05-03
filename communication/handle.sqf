/**
 * Communication Module (Handler)
 */

#define THIS_MODULE communication
#include "x_macros.sqf"

if (hasInterface) then {
    BIS_MENU_GroupCommunication = [
        ["Options", false]
    ];
    
    if (!isNil QMODULE(construction)) then {
        __submodulePP(construction);
    };
    
    if (!isNil QMODULE(perk)) then {
        __submodulePP(perk);
    };
    
    if (!isNil QMODULE(squad)) then {
        __submodulePP(squad);
    };
};