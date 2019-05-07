/**
 * Revive Module (Handler)
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

if (hasInterface) then {
    [nil, player, "per", rAddAction, "Revive" call FUNC(common,RedText), __function(revive), [], 10, false, true, "", "player != _target && {player == vehicle player} && {lifeState _target == 'UNCONSCIOUS'} && {!(_target getVariable 'd_reviving')}"] call RE;
};