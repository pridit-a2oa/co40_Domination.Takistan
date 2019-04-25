#include "x_macros.sqf"
private ["_group"];

_group = X_JIPH getVariable QGVAR(groups);

if (GVAR(artillery) find (str(player)) != -1) exitWith {
    ((units (_group select 0)) + [player]) joinSilent (_group select 0);
};

if (GVAR(engineers) find (str(player)) != -1) exitWith {
    ((units (_group select 1)) + [player]) joinSilent (_group select 1);
};

if (GVAR(machine_gunners) find (str(player)) != -1) exitWith {
    ((units (_group select 2)) + [player]) joinSilent (_group select 2);
};

if (GVAR(marksman) find (str(player)) != -1) exitWith {
    ((units (_group select 3)) + [player]) joinSilent (_group select 3);
};

if (GVAR(medics) find (str(player)) != -1) exitWith {
    ((units (_group select 4)) + [player]) joinSilent (_group select 4);
};

if (GVAR(pilots) find (str(player)) != -1) exitWith {
    ((units (_group select 5)) + [player]) joinSilent (_group select 5);
};