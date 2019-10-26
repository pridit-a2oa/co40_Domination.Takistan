/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

if (isServer) then {
    __fsm(watcher);
};

if (hasInterface) then {    
    waitUntil {count (X_JIPH getVariable QGVAR(groups)) == count GVAR(group_names) && {{[grpNull, _x] call BIS_fnc_areEqual} count (X_JIPH getVariable QGVAR(groups)) == 0}};
    
    call FUNC(THIS_MODULE,assign);
    
    [200] call FUNC(client,reveal);
    
    if (!isNil QMODULE(communication)) then {
        {
            [
                BIS_MENU_Squad,
                format ["Join %1", GVAR(group_names) select _forEachIndex],
                "1",
                format ["[player] joinSilent ((X_JIPH getVariable 'd_groups') select %1); [100] call d_fnc_client_reveal", _forEachIndex]
            ] call FUNC(communication,add);
        } forEach (X_JIPH getVariable QGVAR(groups));
        
        [
            BIS_MENU_Squad,
            "Leave",
            "",
            "[player] joinSilent grpNull; [100] call d_fnc_client_reveal"
        ] call FUNC(communication,add);
    };
};