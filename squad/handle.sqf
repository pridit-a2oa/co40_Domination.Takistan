/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (!isNil QMODULE(communication)) then {
    [
        BIS_MENU_Squad,
        "Leave Squad",
        "1-IsAlone",
        "[player] joinSilent grpNull"
    ] call FUNC(communication,add);
};

[nil, player, "per", rAddAction, "Join Squad", __function(join), [], 3, false, true, "", "group player != (group _target)"] call RE;