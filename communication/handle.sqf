/**
 * Communication Module (Handler)
 */

#define THIS_MODULE communication
#include "x_macros.sqf"

if (hasInterface) then {
    BIS_MENU_GroupCommunication = [
        ["Options", false]
    ];
    
    if (!isNil QMODULE(admin)) then {
        __submodulePP(admin);
    };
    
    if (!isNil QMODULE(construction)) then {
        __submodulePP(construction);
    };
    
    if (!isNil QMODULE(perk)) then {
        __submodulePP(perk);
    };
    
    if (!isNil QMODULE(squad)) then {
        __submodulePP(squad);
    };
    
    if (!isNil QMODULE(setting)) then {
        __submodulePP(setting);
    };
};