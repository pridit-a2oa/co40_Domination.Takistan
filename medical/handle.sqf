/**
 * Medical Module (Handler)
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(inventory)) then {
        __submoduleVM(inventory);
    };

    if (GVAR(medics) find (str(player)) == -1) then {
        player addAction [
            "Use Medkit" call FUNC(common,YellowText),
            __function(heal),
            [],
            9,
            false,
            true,
            "",
            "player == _target && {player == vehicle player} && {(position player) select 2 < 1} && {player getVariable 'd_medkits' > 0} && {!d_healing} && {(damage player >= d_medical_threshold_damage) || !(canStand player)}"
        ];
    };
};