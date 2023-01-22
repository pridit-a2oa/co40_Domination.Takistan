#define THIS_MODULE inventory
#include "x_macros.sqf"
private ["_target", "_type"];

_type = format ["d_inventory_%1", _this select 3];

_target = _this select 0;

[true, "say3D", [_target, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);

_target setVariable [_type, (_target getVariable _type) + 1, true];
player setVariable [_type, (player getVariable _type) - 1, true];

[_target, "systemChat", format [
    "You have been given a %1 by %2",
    [_this select 3] call FUNC(THIS_MODULE,name),
    name player
]] call FUNC(network,mp);