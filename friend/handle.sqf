/**
 * Friend Module (Handler)
 */

#define THIS_MODULE friend
#include "x_macros.sqf"

if (hasInterface) then {
    [nil, player, "per", rAddAction, "Add Friend", __function(add), [], 9, false, true, "", "player != _target && {alive _target} && {(player getVariable 'd_friends') find _target == -1}"] call RE;
};