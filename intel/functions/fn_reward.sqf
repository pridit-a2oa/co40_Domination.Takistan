#define THIS_MODULE intel
#include "x_macros.sqf"

player removeWeapon GVAR(intel_type_item);

if !(isNil QMODULE(reward)) then {
    [
        player,
        GVAR(intel_amount_score),
        "retrieving intel"
    ] call FUNC(reward,score);
};