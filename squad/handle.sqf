/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (isServer) then {
    X_JIPH setVariable [QGVAR(groups), [[
        "B Alpha",
        "B Bravo",
        "B Charlie",
        "B Delta",
        "B Echo",
        "B Foxtrot"
    ]] call FUNC(THIS_MODULE,groups), true];
};

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(groups)}};
    
    call FUNC(THIS_MODULE,assign);

    if (!isNil QMODULE(communication)) then {        
        {
            [
                BIS_MENU_Squad,
                format ["Join %1", GVAR(group_names) select _forEachIndex],
                "1",
                format ["[player] joinSilent ((X_JIPH getVariable 'd_groups') select %1)", _forEachIndex]
            ] call FUNC(communication,add);
        } forEach (X_JIPH getVariable QGVAR(groups));
        
        [
            BIS_MENU_Squad,
            "Leave",
            "1-IsAlone",
            "[player] joinSilent grpNull"
        ] call FUNC(communication,add);
    };
    
    [nil, player, "per", rAddAction, "Join Squad", __function(join), [], 10, false, true, "", "group player != (group _target)"] call RE;
};