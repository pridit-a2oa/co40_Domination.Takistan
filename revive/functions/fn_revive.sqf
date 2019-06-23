#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

_target setVariable [QGVAR(reviving), true, true];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 7;

if (!alive player || {lifeState player == "UNCONSCIOUS"}) exitWith {
    _target setVariable [QGVAR(reviving), false, true];
};

if (lifeState _target != "UNCONSCIOUS") exitWith {};

[nil, _target, "loc", rSwitchMove, ""] call RE;
[nil, _target, "loc", rSwitchMove, "AmovPpneMstpSnonWnonDnon_healed"] call RE;
[nil, _target, "loc", rExecVM, __function(reset)] call RE;

[nil, nil, rSpawn, [_target, _caller], {systemChat format ["%1 has been revived by %2", name (_this select 0), name (_this select 1)]}] call RE;

_target setDamage (player getVariable QGVAR(revive_damage));
_target setVariable [QGVAR(reviving), false, true];