#include "x_macros.sqf"

FUNC(core,GreyText) = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
FUNC(core,RedText) = {"<t color='#f0ff0000'>" + _this + "</t>"};
FUNC(core,BlueText) = {"<t color='#f07f7f00'>" + _this + "</t>"}; //olive
FUNC(core,YellowText) = {"<t color='#e7e700'>" + _this + "</t>"};

GVAR(artillery) = [];
GVAR(engineers) = [];
GVAR(machine_gunners) = [];
GVAR(marksman) = [];
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
    GVAR(marksman) = GVAR(marksman) + ["MARKSMAN" + str _i];
};

for "_i" from 1 to 8 do {
    GVAR(medics) = GVAR(medics) + ["MEDIC" + str _i];
};

for "_i" from 1 to 6 do {
    GVAR(pilots) = GVAR(pilots) + ["PILOT" + str _i];
};

GVAR(player_entities) = GVAR(artillery) + GVAR(engineers) + GVAR(machine_gunners) + GVAR(marksman) + GVAR(medics) + GVAR(pilots);