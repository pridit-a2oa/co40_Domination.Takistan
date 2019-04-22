/**
 * Medical Module (Handler)
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

if (!isNil QMODULE(inventory)) then {
    __submodule(inventory);
};

if (GVAR(medics) find (str(player)) == -1) then {
    player addAction ["Use Medkit (self)" call FUNC(common,YellowText), FUNCTION(THIS_MODULE,heal), [], 9, false, true, "", "player == _target && {player getVariable 'd_medkits' > 0} && {alive player} && {vehicle player == player} && {((getPos player) select 2) < 1} && {(damage player >= d_heal_threshold) || !(canStand player)}"];
};

{
    _x addAction ["Replenish Medkits" call FUNC(common,OliveText), __function(replenish), [], 2, false, true, "", "player getVariable 'd_medkits' < 1 && {player getVariable 'd_medkits_max' > 0}"];
} forEach [MEDIC_TENT1, MEDIC_TENT2];