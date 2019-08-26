#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

_target setVariable [QGVAR(reviving), true, true];

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 5;

if (!alive _target) exitWith {};

_target setVariable [QGVAR(unconscious), false, true];

_target setDamage (player getVariable QGVAR(revive_damage));

[true, "systemChat", format [
    "%1 has been revived by %2",
    name _target,
    name _caller
]] call FUNC(network,mp);