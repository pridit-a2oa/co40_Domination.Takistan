#include "x_macros.sqf"
private ["_target", "_type"];

_type = _this select 3;

if (GVAR(inventory_types) find _type == -1) exitWith {};

_type = (format [QGVAR(%1), _type]);

_target = _this select 0;

[nil, _target, rSay, QGVAR(sound_item), 20] call RE;

_target setVariable [_type, (_target getVariable _type) + 1, true];
player setVariable [_type, (player getVariable _type) - 1, true];