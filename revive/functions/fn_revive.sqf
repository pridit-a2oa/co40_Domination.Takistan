#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

[nil, _target, "loc", rSpawn, [_target], {(_this select 0) setUnconscious false}] call RE;
[nil, _target, rSwitchMove, "AmovPpneMstpSnonWnonDnon_healed"] call RE;
[nil, nil, rSpawn, [_target, _caller], {systemChat format ["%1 has been revived by %2", name (_this select 0), name (_this select 1)]}] call RE;

_target setDamage (player getVariable QGVAR(revive_damage));