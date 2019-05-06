/**
 * Friend Module (Handler)
 */

#define THIS_MODULE friend
#include "x_macros.sqf"

if (hasInterface) then {
    [nil, player, "per", rAddAction, "Add Friend" call FUNC(common,YellowText), __function(add), [], 10, false, true, "", "player != _target && {alive _target} && {lifeState _target != 'UNCONSCIOUS'} && {(player getVariable 'd_friends') find (getPlayerUIDOld _target) == -1}"] call RE;
};