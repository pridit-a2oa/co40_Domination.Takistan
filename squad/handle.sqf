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
    
    sleep 2;
    
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
            "",
            "[player] joinSilent grpNull; call d_fnc_squad_reveal"
        ] call FUNC(communication,add);
    };
};