#define THIS_MODULE ammobox
#include "x_macros.sqf"
private ["_ammobox"];

PARAMS_1(_ammobox);

if (hasInterface) then {
    if (!isNil QMODULE(perk)) then {
        [_ammobox] __submodulePP(perk);
    };
};