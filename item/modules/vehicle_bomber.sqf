#define THIS_MODULE item
#include "x_macros.sqf"
private ["_item"];

if (isNil QMODULE(item_money)) exitWith {false};

_item = GVAR(item_money_type) select 1;

if !([_item] call FUNC(THIS_MODULE,valid)) exitWith {false};

player removeWeapon (GVAR(item_money_type) select 1);

[true, "say3D", [player, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);

true