#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

_target setVariable [QGVAR(reviving), true, true];

if ([_target] call FUNC(THIS_MODULE,valid)) then {
    if !([] call FUNC(client,stall)) exitWith {};
    if !([_target] call FUNC(THIS_MODULE,valid)) exitWith {};

    _target setDamage (switch (true) do {
        case (str player in GVAR(MEDI)): {0};
        default {GVAR(revive_amount_damage)};
    });

    [true, "systemChat", format [
        "%1 has been revived by %2",
        name _target,
        name player
    ]] call FUNC(network,mp);

    _target setVariable [QGVAR(unconscious), false, true];

    if !(isNil QMODULE(statistic)) then {
        [gameLogic, "execVM", [[8, [getPlayerUID player, name player]], FUNCTION(statistic,set)]] call FUNC(network,mp);
    };
};

_target setVariable [QGVAR(reviving), false, true];