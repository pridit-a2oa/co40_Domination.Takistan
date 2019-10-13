#define THIS_MODULE common
#include "x_macros.sqf"

FUNC(THIS_MODULE,GreyText) = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
FUNC(THIS_MODULE,RedText) = {"<t color='#c54a30'>" + _this + "</t>"};
FUNC(THIS_MODULE,YellowText) = {"<t color='#a3ae55'>" + _this + "</t>"};
FUNC(THIS_MODULE,BlueText) = {"<t color='#5398b6'>" + _this + "</t>"};
FUNC(THIS_MODULE,BrownText) = {"<t color='#614c15'>" + _this + "</t>"};

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