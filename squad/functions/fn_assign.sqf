#include "x_macros.sqf"
private ["_group"];

_group = X_JIPH getVariable QGVAR(groups);

{
    if (count units _x > 0) then {
        (units _x) joinSilent _x;
    };
} forEach _group;

if (GVAR(artillery) find (str(player)) != -1) exitWith {
    [player] joinSilent (_group select 0);
};

if (GVAR(engineers) find (str(player)) != -1) exitWith {
    [player] joinSilent (_group select 1);
};

if (GVAR(machine_gunners) find (str(player)) != -1) exitWith {
    [player] joinSilent (_group select 2);
};

if (GVAR(marksman) find (str(player)) != -1) exitWith {
    [player] joinSilent (_group select 3);
};

if (GVAR(medics) find (str(player)) != -1) exitWith {
    [player] joinSilent (_group select 4);
};

if (GVAR(pilots) find (str(player)) != -1) exitWith {
    [player] joinSilent (_group select 5);
};