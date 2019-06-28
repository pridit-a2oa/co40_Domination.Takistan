#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

_target setVariable [QGVAR(reviving), true, true];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 5;

[_target, "AmovPpneMstpSnonWnonDnon_healed"] call FUNC(network,switchMove);

[_target, false] call FUNC(network,setUnconscious);
[_target, false] call FUNC(network,setCaptive);

[_target] call FUNC(THIS_MODULE,reset);

_target setDamage (player getVariable QGVAR(revive_damage));

[nil, nil, rSpawn, [_target, _caller], {systemChat format ["%1 has been revived by %2", name (_this select 0), name (_this select 1)]}] call RE;