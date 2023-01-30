#define THIS_MODULE intel
#include "x_macros.sqf"

if !(call FUNC(THIS_MODULE,valid)) exitWith {};

player removeWeapon GVAR(intel_type_item);

[gameLogic, "addScore", [player, GVAR(intel_amount_score)]] call FUNC(network,mp);

systemChat format [
    "You have been given %1 score for retrieving intel",
    GVAR(intel_amount_score)
];

playSound "beep";