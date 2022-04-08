#include "x_macros.sqf"
private ["_groups"];

_groups = X_JIPH getVariable QGVAR(groups);

{
    _x setGroupId [GVAR(group_names) select _forEachIndex];
    
    if (count units _x > 0) then {
        (units _x) joinSilent _x;
    };
} forEach _groups;

if (GVAR(artillery) find (str player) != -1) exitWith {
    [player] joinSilent (_groups select 0);

    (_groups select 0)
};

if (GVAR(engineers) find (str player) != -1) exitWith {
    [player] joinSilent (_groups select 1);

    (_groups select 1)
};

if (GVAR(machine_gunners) find (str player) != -1) exitWith {
    [player] joinSilent (_groups select 2);

    (_groups select 2)
};

if (GVAR(marksman) find (str player) != -1) exitWith {
    [player] joinSilent (_groups select 3);

    (_groups select 3)
};

if (GVAR(medics) find (str player) != -1) exitWith {
    [player] joinSilent (_groups select 4);

    (_groups select 4)
};

if (GVAR(pilots) find (str player) != -1) exitWith {
    [player] joinSilent (_groups select 5);

    (_groups select 5)
};