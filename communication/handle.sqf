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

    if (!isNil QMODULE(vote)) then {
        __submodulePP(vote);
    };

    BIS_MENU_GroupCommunication = BIS_MENU_GroupCommunication + [
        ["", [(count BIS_MENU_GroupCommunication) + 1], "", -1, [["expression", ""]], "1", "1"]
    ];

    if (!isNil QMODULE(setting)) then {
        __submodulePP(setting);
    };

    if (!isNil QMODULE(admin)) then {
        __submodulePP(admin);
    };
};