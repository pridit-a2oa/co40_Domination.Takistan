/**
 * Squad Module (Handler)
 */

#define THIS_MODULE squad
#include "x_macros.sqf"

{
    if (isServer) then {
        _group = createGroup west;
        _group setGroupId [_x];

        [nil, player, "per", rSpawn, [_group, _x], {(_this select 0) setGroupId [(_this select 1)]}] call RE;
    };
} forEach GVAR(group_names);

0 spawn FUNC(THIS_MODULE,assign);

GVAR(groups) = [[
    "B Alpha",
    "B Bravo",
    "B Charlie",
    "B Delta",
    "B Echo",
    "B Foxtrot"
]] call FUNC(THIS_MODULE,groups);

if (hasInterface) then {
    if (!isNil QMODULE(communication)) then {        
        {
            [
                BIS_MENU_Squad,
                format ["Join %1", GVAR(group_names) select _forEachIndex],
                "1",
                format ["[player] joinSilent (d_groups select %1)", _forEachIndex]
            ] call FUNC(communication,add);
        } forEach GVAR(groups);
        
        [
            BIS_MENU_Squad,
            "Leave",
            "1-IsAlone",
            "[player] joinSilent grpNull"
        ] call FUNC(communication,add);
    };
};

[nil, player, "per", rAddAction, "Join Squad", __function(join), [], 10, false, true, "", "group player != (group _target)"] call RE;