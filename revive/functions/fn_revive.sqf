#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_target", "_caller"];

PARAMS_2(_target, _caller);

_target setVariable [QGVAR(reviving), true, true];

if ([_target] call FUNC(THIS_MODULE,valid)) then {
    player playMove "AinvPknlMstpSlayWrflDnon_medic";

    sleep 2;

    if (!([_target] call FUNC(THIS_MODULE,valid))) exitWith {};

    [true, "switchMove", [player, "AinvPknlMstpSlayWrflDnon_medic"]] call FUNC(network,mp);

    sleep 5;

    if (!([_target] call FUNC(THIS_MODULE,valid))) exitWith {};

    _target setDamage (switch (true) do {
        case ((str player) in GVAR(medics)): {0};
        default {GVAR(revive_amount_damage)};
    });

    [true, "systemChat", format [
        "%1 has been revived by %2",
        name _target,
        name _caller
    ]] call FUNC(network,mp);

    _target setVariable [QGVAR(unconscious), false, true];
};

_target setVariable [QGVAR(reviving), false, true];