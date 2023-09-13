#define THIS_MODULE item
#include "x_macros.sqf"
private ["_item", "_sound"];

PARAMS_1(_item);

_sound = [_this, 1, false] call FUNC(common,param);

if !([_item select 1] call FUNC(THIS_MODULE,valid)) exitWith {false};

player removeWeapon (_item select 1);

if (_sound) then {
    [true, "say3D", [player, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);
};

[gameLogic, "spawn", [[_item select 0], {
    __log format ["Used %1", _this select 0]];
}]] call FUNC(network,mp);

true