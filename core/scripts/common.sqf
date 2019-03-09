#include "x_macros.sqf"

GVAR(artillery) = [];
GVAR(engineers) = [];
GVAR(machine_gunners) = [];
GVAR(marksmen) = [];
GVAR(medics) = [];
GVAR(pilots) = [];

for "_i" from 1 to 2 do {
    GVAR(artillery) = GVAR(artillery) + ["ARTY" + str _i];
};

for "_i" from 1 to 8 do {
    GVAR(engineers) = GVAR(engineers) + ["ENGINEER" + str _i];
};

for "_i" from 1 to 8 do {
    GVAR(machine_gunners) = GVAR(machine_gunners) + ["MGUNNER" + str _i];
};

for "_i" from 1 to 8 do {
    GVAR(marksmen) = GVAR(marksmen) + ["MARKSMAN" + str _i];
};

for "_i" from 1 to 8 do {
    GVAR(medics) = GVAR(medics) + ["MEDIC" + str _i];
};

for "_i" from 1 to 6 do {
    GVAR(pilots) = GVAR(pilots) + ["PILOT" + str _i];
};

GVAR(player_entities) = GVAR(artillery) + GVAR(engineers) + GVAR(machine_gunners) + GVAR(marksmen) + GVAR(medics) + GVAR(pilots);