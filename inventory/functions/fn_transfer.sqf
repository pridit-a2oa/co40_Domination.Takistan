#define THIS_MODULE inventory
#include "x_macros.sqf"
private ["_target", "_type"];

_type = (format [QGVAR(%1), _this select 3]);

_target = _this select 0;

[nil, _target, rSay, QGVAR(sound_item), 20] call RE;

_target setVariable [_type, (_target getVariable _type) + 1, true];
player setVariable [_type, (player getVariable _type) - 1, true];

[nil, _target, "loc", rSpawn, [player, _this select 3], {systemChat format ["You have been given a %1 by %2", [(_this select 1)] call FUNC(THIS_MODULE,name), name (_this select 0)]}] call RE;