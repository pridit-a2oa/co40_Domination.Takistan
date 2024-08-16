#include "x_macros.sqf"
private ["_squads"];

_squads = X_JIPH getVariable QGVAR(squads);

{
    _x setGroupId [GVAR(group_names) select _forEachIndex];

    if (count units _x > 0) then {
        (units _x) joinSilent _x;
    };
} forEach _squads;

if (str player in GVAR(artillery)) exitWith {
    [player] joinSilent (_squads select 0);

    (_squads select 0)
};

if (str player in GVAR(engineers)) exitWith {
    [player] joinSilent (_squads select 1);

    (_squads select 1)
};

if (str player in GVAR(machine_gunners)) exitWith {
    [player] joinSilent (_squads select 2);

    (_squads select 2)
};

if (str player in GVAR(marksman)) exitWith {
    [player] joinSilent (_squads select 3);

    (_squads select 3)
};

if (str player in GVAR(medics)) exitWith {
    [player] joinSilent (_squads select 4);

    (_squads select 4)
};

if (str player in GVAR(pilots)) exitWith {
    [player] joinSilent (_squads select 5);

    (_squads select 5)
};