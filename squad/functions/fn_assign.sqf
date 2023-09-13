#include "x_macros.sqf"
private ["_squads"];

_squads = X_JIPH getVariable QGVAR(squads);

{
    _x setGroupId [GVAR(group_names) select _forEachIndex];
    
    if (count units _x > 0) then {
        (units _x) joinSilent _x;
    };
} forEach _squads;

if (GVAR(artillery) find (str player) != -1) exitWith {
    [player] joinSilent (_squads select 0);

    (_squads select 0)
};

if (GVAR(engineers) find (str player) != -1) exitWith {
    [player] joinSilent (_squads select 1);

    (_squads select 1)
};

if (GVAR(machine_gunners) find (str player) != -1) exitWith {
    [player] joinSilent (_squads select 2);

    (_squads select 2)
};

if (GVAR(marksman) find (str player) != -1) exitWith {
    [player] joinSilent (_squads select 3);

    (_squads select 3)
};

if (GVAR(medics) find (str player) != -1) exitWith {
    [player] joinSilent (_squads select 4);

    (_squads select 4)
};

if (GVAR(pilots) find (str player) != -1) exitWith {
    [player] joinSilent (_squads select 5);

    (_squads select 5)
};