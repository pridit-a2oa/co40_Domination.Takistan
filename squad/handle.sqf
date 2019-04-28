/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (isServer) then {
    __fsm(watcher);
};

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(groups)}};
    
    sleep 1;
    
    call FUNC(THIS_MODULE,assign);
    call FUNC(THIS_MODULE,reveal);

    if (!isNil QMODULE(communication)) then {        
        {
            [
                BIS_MENU_Squad,
                format ["Join %1", GVAR(group_names) select _forEachIndex],
                "1",
                format ["[player] joinSilent ((X_JIPH getVariable 'd_groups') select %1); call d_fnc_squad_reveal", _forEachIndex]
            ] call FUNC(communication,add);
        } forEach (X_JIPH getVariable QGVAR(groups));
        
        [
            BIS_MENU_Squad,
            "Leave",
            "1-IsAlone",
            "[player] joinSilent grpNull; call d_fnc_squad_reveal"
        ] call FUNC(communication,add);
    };
    
    [nil, player, "per", rAddAction, "Join Squad", __function(join), [], 10, false, true, "", "alive _target && {group player != (group _target)}"] call RE;
};