/**
 * Communication Module (Handler)
 */

#define THIS_MODULE communication
#include "x_macros.sqf"

if (hasInterface) then {    
    if (!isNil QMODULE(admin)) then {
        __submodulePP(admin);
    };
    
    if (!isNil QMODULE(construction)) then {
        __submodulePP(construction);
    };
    
    if (!isNil QMODULE(gesture)) then {
        __submodulePP(gesture);
    };
    
    if (!isNil QMODULE(inventory)) then {
        __submodulePP(inventory);
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